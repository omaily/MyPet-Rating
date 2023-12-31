package apiserver

import (
	"encoding/json"
	"net/http"
	"reflect"
	"strings"

	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/render"
	"github.com/go-playground/validator/v10"
	"github.com/jackc/pgx/v5/pgtype"
	"gitlab.com/oldmas/mypet-rating/internal/models"
	"golang.org/x/exp/slog"
)

func (s *APIServer) readObj() http.HandlerFunc {
	return func(write http.ResponseWriter, request *http.Request) {
		retuenObjects, err := s.storage.ReadAllManga(request.Context())
		if err != nil {
			s.log.Info("failed collecting rows", logErr(err))
		}
		json_data, err := json.Marshal(retuenObjects)
		if err != nil {
			s.log.Info("failed Marshal struct manga", logErr(err))
		}
		write.WriteHeader(200)
		_, errr := write.Write(json_data)
		if err != nil {
			s.log.Debug("debug error: ", errr)
		}
	}
}

func (s *APIServer) insertObj() http.HandlerFunc {
	return func(write http.ResponseWriter, request *http.Request) {

		s.log = slog.With(
			slog.String("konponent handler", "rating.manga.insertObj"),
			slog.String("request_id", middleware.GetReqID(request.Context())),
		)

		decoder := json.NewDecoder(request.Body)
		decoder.DisallowUnknownFields()          // генерирует ошибку если в json есть поля которых нет в структуре (структура все равно распарсится)
		remakeTitle := map[string]models.Manga{} // map потому что приходит {id:{}, id:{}, id:{}} а не массив [{}, {}, {}]
		err := decoder.Decode(&remakeTitle)
		if err != nil { //из за переопределения сигнатуры jsonUnmarshal неизвестные поля не выдают ошибку (хз че делать)
			s.log.Error("failed to decode request", err)
			render.JSON(write, request, Error("failed to decode request"))
			return
		}

		validate := validator.New()

		// ActualTag равен первому тегу json (пошел нахуй omitempty)
		validate.RegisterTagNameFunc(func(fld reflect.StructField) string {
			name := strings.SplitN(fld.Tag.Get("json"), ",", 2)[0]
			if name == "-" {
				return ""
			}
			return name
		})

		// реализация не встроенных типов на тег rerequired
		validate.RegisterCustomTypeFunc(ValidateCustom, pgtype.Text{}, pgtype.Timestamptz{})

		// когда есть зависимость пары полей друг от друга в моем случае даты
		validate.RegisterStructValidation(ValidatePeriod, models.Manga{})

		for _, val := range remakeTitle {
			if err := validate.Struct(val); err != nil {
				s.log.Error("invalid request", err)
				render.JSON(write, request, ValidateError(err.(validator.ValidationErrors)))
				return
			}
		}

		// rate.CopyInsertManga(request.Context(), remakeTitle)
		// if err != nil {
		// 		log.Error("invalid insert", err)
		// 		render.JSON(write, request, resp.ValidateError(err.(validator.ValidationErrors)))
		// 		return
		// }
		// render.JSON(write, request, resp.Ok())

		id, err := s.storage.BulkInsertManga(request.Context(), remakeTitle)
		if err != nil {
			s.log.Error("invalid insert", err)
			render.JSON(write, request, ValidateError(err.(validator.ValidationErrors)))
			return
		}
		render.JSON(write, request, Ok(id...))

	}
}
