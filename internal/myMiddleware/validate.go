package myMiddleware

import (
	"errors"
	"fmt"
	"log/slog"
	"reflect"
	"strings"

	"github.com/go-playground/validator/v10"
	answer "github.com/omaily/MyPet-Rating/internal/controller/respons"
)

type Title interface {
	// TestStruct() float64
}

func ValidateManga(title Title) *answer.ErrResponse {

	validate := validator.New()
	validate.RegisterTagNameFunc(func(fld reflect.StructField) string {
		// Нужен только первый тег json (игнорируем omitempty)
		name := strings.SplitN(fld.Tag.Get("json"), ",", 2)[0]
		if name == "-" {
			return ""
		}
		return name
	})

	// // реализация не встроенных типов на тег rerequired
	// validate.RegisterCustomTypeFunc(ValidateCustom, pgtype.Text{}, pgtype.Timestamptz{})
	// // когда есть зависимость пары полей друг от друга в моем случае даты
	// validate.RegisterStructValidation(ValidatePeriod, modelRest.Manga{})

	err := validate.Struct(title)
	if err != nil {
		slog.Error("invalid request", err)
		return ValidateError(err.(validator.ValidationErrors))
	}
	return nil
}

func ValidateError(e validator.ValidationErrors) *answer.ErrResponse {
	res := answer.NewErrValidaete(errors.New("required fields are not specified"))
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
