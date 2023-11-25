package apiserver

import (
	"database/sql/driver"
	"fmt"
	"reflect"

	"github.com/go-playground/validator/v10"
	"gitlab.com/oldmas/mypet-rating/internal/models"
	"golang.org/x/exp/slog"
)

type ErrorRespons struct {
	Status     string            `json:"status"`
	StatusCode int               `json:"status_code"`
	StatusText string            `json:"error,omitempty"`
	Id         []int             `json:"id,omitempty"` //возвращается при Insert или Update
	Valid      []MyValidateError `json:"validateError,omitempty"`
}

type MyValidateError struct {
	NameStruct    string `json:"nameStruct"`
	Type          string `json:"type"`
	NameFieldJson string `json:"nameFieldJson"`
	ActualTag     string `json:"actualTag"`
	Value         string `json:"value"`
	Message       string `json:"message"`
}

func logErr(err error) slog.Attr {
	return slog.Attr{
		Key:   "error",
		Value: slog.StringValue(err.Error()),
	}
}

func Ok(a ...int) *ErrorRespons {
	// проверка на nil не нужна, так как поле id опционально
	return &ErrorRespons{
		Status:     "Ok",
		StatusCode: 200,
		Id:         a,
	}
}

func Error(msgReq string) *ErrorRespons {
	return &ErrorRespons{
		Status:     "error",
		StatusCode: 400,
		StatusText: msgReq,
	}
}

func ServerError() *ErrorRespons {
	return &ErrorRespons{
		Status:     "Error",
		StatusCode: 500,
		StatusText: "Internal server error",
	}
}

// работает потому что библиотека pgtype совместима с driver.Valuer
func ValidateCustom(field reflect.Value) interface{} {
	if valuer, ok := field.Interface().(driver.Valuer); ok {
		val, err := valuer.Value()
		if err == nil {
			return val
		}
		// handle the error how you want
	}
	return nil
}

func ValidatePeriod(v validator.StructLevel) {
	title := v.Current().Interface().(models.Manga)

	if title.Finish_date.Valid && title.Finish_date.Time.Before(title.Start_date.Time) {
		v.ReportError(title.Start_date, "start_d", "Start_date", "period", "")
		v.ReportError(title.Finish_date, "finish_d", "Finish_date", "period", "")
	}
}

func ValidateError(e validator.ValidationErrors) *ErrorRespons {

	res := &ErrorRespons{
		Status:     "Error",
		StatusCode: 400,
		StatusText: "failed validete structure",
	}

	for _, err := range e { // ошибка может прийти не по одному полю
		e := MyValidateError{
			NameStruct:    err.StructField(),
			Type:          fmt.Sprintf("%v", err.Type()),
			NameFieldJson: err.Field(),
			ActualTag:     err.ActualTag(),
			Value:         fmt.Sprintf("%v", err.Value()),
			Message:       err.Error(),
		}

		switch err.ActualTag() {
		case "period":
			e.Message = "err field FinishDate less StartDate"
		}

		res.Valid = append(res.Valid, e)
	}

	return res
}
