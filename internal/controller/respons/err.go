package respons

import (
	"net/http"

	"github.com/go-chi/render"
)

type ResponseFetch struct {
	Status      string `json:"status"`
	StatusCode  int    `json:"status_code"`
	TextError   string `json:"error,omitempty"`
	Id          []int  `json:"id,omitempty"` //возвращается при Insert или Update
	AccessToken string `json:"access_token,omitempty"`
}

func (e *ResponseFetch) Render(w http.ResponseWriter, r *http.Request) error {
	w.Header().Set("Content-Type", "application/json")
	render.Status(r, e.StatusCode)
	return nil
}

func Ok(a ...int) *ResponseFetch {
	// проверка на nil не нужна, так как поле id опционально
	return &ResponseFetch{
		Status:     "Ok",
		StatusCode: 200,
		Id:         a,
	}
}

func Bearer(token string) *ResponseFetch {
	return &ResponseFetch{
		Status:      "Ok",
		StatusCode:  200,
		AccessToken: token,
	}
}
