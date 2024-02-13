package handler

import (
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/render"

	answer "github.com/omaily/MyPet-Rating/internal/controller/respons"
	"github.com/omaily/MyPet-Rating/internal/myMiddleware"
)

func HandlersSecure(router *chi.Mux) {
	router.Group(func(r chi.Router) {
		r.Use(myMiddleware.AuthHeader)
		r.Post("/auth/work", work())
	})
}

func work() http.HandlerFunc {
	return func(write http.ResponseWriter, request *http.Request) {
		render.JSON(write, request, answer.Ok("322"))
	}
}
