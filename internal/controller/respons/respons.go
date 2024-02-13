package respons

import (
	"net/http"

	"github.com/go-chi/render"
)

type InternalError struct{}

func (m *InternalError) Error() string {
	return "Internal error"
}

type AlreadyExistsError struct{}

func (m *AlreadyExistsError) Error() string {
	return "email address already exists"
}

type ErrResponse struct {
	Err            error           `json:"-"`               // low-level runtime error
	HTTPStatusCode int             `json:"-"`               // http response status code
	StatusText     string          `json:"status"`          // user-level status message
	AppCode        int64           `json:"code,omitempty"`  // application-specific error code
	ErrorText      string          `json:"error,omitempty"` // application-level error message, for debugging
	Valid          []ValidateError `json:"validateError,omitempty"`
}

type ValidateError struct {
	Field     string `json:"field"`
	Type      string `json:"type"`
	FieldJSON string `json:"fieldJson"`
	Value     string `json:"value"`
	Message   string `json:"message"`
}

func (e *ErrResponse) Render(w http.ResponseWriter, r *http.Request) error {
	render.Status(r, e.HTTPStatusCode)
	return nil
}

func ErrReview(err error) render.Renderer {
	switch err := err.(type) {
	case *InternalError:
		return ErrInternalServer(err)
	case *AlreadyExistsError:
		return ErrAlreadyExists(err)
	default:
		return ErrInvalidRequest(err)
	}
}
func ErrValidaete(err error) *ErrResponse {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: 400,
		StatusText:     "Invalid validate",
		ErrorText:      err.Error(),
	}
}

func ErrInvalidRequest(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: 400,
		StatusText:     "Invalid request",
		ErrorText:      err.Error(),
	}
}

func ErrAlreadyExists(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: 409,
		StatusText:     "Conflict response",
		ErrorText:      err.Error(),
	}
}

func ErrInternalServer(err error) render.Renderer {
	return &ErrResponse{
		Err:            err,
		HTTPStatusCode: 500,
		StatusText:     "Internal problems",
		ErrorText:      err.Error(),
	}
}
