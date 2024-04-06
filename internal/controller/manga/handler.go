package handler

import (
	"log/slog"
	"net/http"
	"strconv"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/render"
	"github.com/omaily/MyPet-Rating/api/model"
	answer "github.com/omaily/MyPet-Rating/internal/controller/respons"
	"github.com/omaily/MyPet-Rating/internal/database"
	"github.com/omaily/MyPet-Rating/internal/myMiddleware"
)

func HandlersGlobal(router *chi.Mux, storage *database.Storage) {
	router.HandleFunc("/", defaultRoute())
	router.Route("/api/manga", func(r chi.Router) {
		r.Get("/read/{articleID}", readId(storage))
		r.Get("/read", readParam(storage))
		r.Get("/read/order={order:(id|title|rating|start_d)}", readRegular(storage))
		r.Post("/create", create(storage))
		r.Post("/update", update(storage))
		r.Post("/delete", delete(storage))
	})
}

func defaultRoute() http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello World"))
	}
}

func readId(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		logger := slog.With(
			slog.String("HandlerFunc", "read"),
		)

		articleID := chi.URLParam(request, "articleID")
		id, err := strconv.Atoi(articleID)
		if err != nil {
			slog.Error("Invalid Article ID", slog.String("err", err.Error()))
			render.Render(writer, request, answer.ErrInvalidRequest(err))
			return
		}

		title, arr, err := storage.ReadIdManga(request.Context(), id)
		if err != nil {
			logger.Error("failed collecting rows", slog.String("err", err.Error()))
			render.Render(writer, request, answer.ErrInternalServer(err))
			return
		}

		titleFull := struct {
			model.Manga
			Tags []string
		}{
			Manga: title,
			Tags:  arr,
		}

		render.JSON(writer, request, titleFull)
	}
}

func readParam(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {

		logger := slog.With(
			slog.String("HandlerFunc", "read"),
		)

		retuenObjects, err := storage.ReadAllManga(request.Context(), urlQueryParam(request.URL.Query()))
		if err != nil {
			logger.Error("failed collecting rows", slog.String("err", err.Error()))
			render.Render(writer, request, answer.ErrInternalServer(err))
			return
		}

		render.JSON(writer, request, retuenObjects)
	}
}

func readRegular(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {

		logger := slog.With(
			slog.String("HandlerFunc", "read"),
		)

		retuenObjects, err := storage.ReadAllManga(request.Context(), urlRegularParam(request))
		if err != nil {
			logger.Error("failed collecting rows", slog.String("err", err.Error()))
			render.Render(writer, request, answer.ErrInternalServer(err))
			return
		}

		render.JSON(writer, request, retuenObjects)
	}
}

func create(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {

		logger := slog.With(
			slog.String("HandlerFunc", "handler-insert"),
		)

		mangas, err := newMangaParsingJSON(request)
		if err != nil {
			logger.Error("failed to parsing json", err)
			render.Render(writer, request, answer.ErrInvalidRequest(err))
			return
		}

		var validateEror *answer.ErrResponse
		for key, manga := range mangas {
			logger.With(key, manga).Debug("Struct Json")
			if err := myMiddleware.ValidateManga(manga); err != nil {
				logger.Error("invalid request", err.Err)
				validateEror = err
			}
		}

		// rate.CopyInsertManga(request.Context(), remakeTitle)
		// if err != nil {
		// 		log.Error("invalid insert", err)
		// 		render.JSON(write, request, resp.ValidateError(err.(validator.ValidationErrors)))
		// 		return
		// }
		// render.JSON(write, request, resp.Ok())

		id, err := storage.BulkInsertManga(request.Context(), mangas)
		if err != nil {
			logger.Error("invalid insert", err)
			render.Render(writer, request, answer.ErrInternalServer(err))
			return
		}

		_ = id

		if validateEror == nil {
			render.Render(writer, request, answer.Ok(id...))
		} else {
			render.Render(writer, request, validateEror)
		}
	}

}

func update(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello update-object"))
	}
}

func delete(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello write-object"))
	}
}
