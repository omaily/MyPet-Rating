package handler

import (
	"log/slog"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/render"
	answer "github.com/omaily/MyPet-Rating/internal/controller/respons"
	"github.com/omaily/MyPet-Rating/internal/database"
)

func HandlersGlobal(router *chi.Mux, storage *database.Storage) {

	router.HandleFunc("/", defaultRoute())

	router.Route("/api/manga", func(r chi.Router) {
		r.Get("/create", create(storage))
		r.Get("/read", read(storage))
		r.Get("/update", update(storage))
		r.Get("/write", write(storage))
	})
}

func defaultRoute() http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello World"))
	}
}

func read(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {

		logger := slog.With(
			slog.String("konponent", "handler-read"),
		)

		retuenObjects, err := storage.ReadAllManga(request.Context())
		if err != nil {
			logger.Error("failed collecting rows", slog.String("err", err.Error()))
			render.Render(writer, request, answer.ErrInternalServer(err))
			return
		}

		// buf := new(bytes.Buffer)
		// enc := json.NewEncoder(buf)
		// // enc.SetEscapeHTML(false)
		// if err := enc.Encode(&retuenObjects); err != nil {
		// 	slog.Error("Failed to decode json", slog.String("err", err.Error()))
		// 	render.Render(writer, request, answer.ErrInvalidRequest(errors.New("failed to decode json")))
		// 	return
		// }
		// writer.WriteHeader(http.StatusOK)
		// _, errr := writer.Write(buf.Bytes())
		// if err != nil {
		// 	logger.Debug("debug error: ", errr)
		// }

		render.JSON(writer, request, retuenObjects)
	}
}

func create(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello create-object"))
	}
}

func update(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello update-object"))
	}
}

func write(storage *database.Storage) http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		writer.WriteHeader(http.StatusOK)
		writer.Write([]byte("Hello write-object"))
	}
}
