package handler

import (
	"encoding/json"
	"errors"
	"fmt"
	"log/slog"
	"net/http"
	"reflect"
	"strings"

	"github.com/go-chi/render"
	"github.com/go-playground/validator/v10"
	"github.com/omaily/MyPet-Rating/api/model"
	answer "github.com/omaily/MyPet-Rating/internal/controller/respons"
)

func parsingJSON(write http.ResponseWriter, request *http.Request) (*model.Manga, error) {
	var manga model.Manga
	decoder := json.NewDecoder(request.Body)
	decoder.DisallowUnknownFields() //генерирует ошибку если в json есть поля которых нет в структуре
	err := decoder.Decode(&manga)
	if err != nil {
		slog.Error("Failed to decode json", slog.String("err", err.Error()))
		render.Render(write, request, answer.ErrInvalidRequest(errors.New("failed to decode json")))
		return nil, err
	}
	return &manga, nil
}

func ValidateManga(manga *model.Manga) *answer.ErrResponse {
	validate := validator.New()
	validate.RegisterTagNameFunc(func(fld reflect.StructField) string {
		// Нужен только первый тег json (игнорируем omitempty)
		name := strings.SplitN(fld.Tag.Get("json"), ",", 2)[0]
		if name == "-" {
			return ""
		}
		return name
	})

	err := validate.Struct(manga)
	if err != nil {
		slog.Error("invalid request", err)
		return ValidateError(err.(validator.ValidationErrors))
	}
	return nil
}

func ValidateError(e validator.ValidationErrors) *answer.ErrResponse {
	res := answer.ErrValidaete(errors.New("failed validete structure"))
	for _, err := range e { // ошибка может прийти не по одному полю
		e := answer.ValidateError{
			Field:     err.StructNamespace(),
			Type:      fmt.Sprintf("%v", err.Type()),
			FieldJSON: err.Field(),
			Message:   err.Error(),
			Value:     err.Param(),
		}
		res.Valid = append(res.Valid, e)
	}
	return res
}
