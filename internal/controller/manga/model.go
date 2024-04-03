package handler

import (
	"encoding/json"
	"net/http"
	"net/url"

	"github.com/go-chi/chi/v5"
	"github.com/omaily/MyPet-Rating/api/model"
)

func newMangaParsingJSON(request *http.Request) (map[string]model.Manga, error) {
	decoder := json.NewDecoder(request.Body)
	decoder.DisallowUnknownFields() // генерирует ошибку если в json есть поля которых нет в структуре
	remakeTitle := map[string]model.Manga{}
	if err := decoder.Decode(&remakeTitle); err != nil {
		return nil, err
	}
	return remakeTitle, nil
}

func urlQueryParam(url url.Values) []*model.Condition {
	var condition []*model.Condition

	for k, v := range url {
		iterable := &model.Condition{Name: k, Value: v}
		condition = append(condition, iterable)
	}

	return condition
}

func urlRegularParam(r *http.Request) []*model.Condition {
	var condition []*model.Condition

	var value = []string{chi.URLParam(r, "order")}
	condition = append(condition, &model.Condition{Name: "order", Value: value})

	return condition
}
