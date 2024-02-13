package myMiddleware

import (
	"errors"
	"net/http"

	"github.com/go-chi/render"
	res "github.com/omaily/MyPet-Rating/internal/controller/respons"
)

func AuthHeader(next http.Handler) http.Handler {
	return http.HandlerFunc(func(write http.ResponseWriter, request *http.Request) {

		token := request.Header["Authorization"]
		if request.Header["Authorization"] == nil || token[0] == "" {
			render.Render(write, request, res.ErrInvalidRequest(errors.New("request does not contain an access token")))
			return
		}

		next.ServeHTTP(write, request)
	})
}
