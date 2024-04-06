package model

import (
	"context"
	"encoding/json"
	"time"

	"github.com/jackc/pgx/v5/pgtype"
)

type Condition struct {
	Name  string
	Value []string
}

type MangaI interface {
	ReadAllManga(context.Context, []Condition) ([]Manga, error)
	BulkInsertManga(context.Context, Manga) error
	CopyInsertManga(context.Context, map[string]Manga) error
}

type Manga struct {
	Id       int         `json:"id,omitempty"`
	Title    pgtype.Text `json:"title" validate:"required"`
	Title_en pgtype.Text `json:"title_en" validate:"required"`
	Author   pgtype.Text `json:"author" validate:"required"`
	// rating это поле точностью 4 и масштабом 2 должно быть округлено до абсолютного значения меньше 10^2
	// на самом деле поле должно быть округленно до значения меньше 10, но если insert into manga value (14,01)
	// golang не выдает ошибки, но при чтении эта строка почему то не возвращается.
	Rating      float64            `json:"rating" validate:"required"`
	Start_date  pgtype.Timestamptz `json:"start_d" validate:"required"`
	Finish_date pgtype.Timestamptz `json:"finish_d"`
	Img         pgtype.Text        `json:"img,omitempty"`
	// Tags        []pgtype.Text      `json:"tags,omitempty"`
}

// задаем значения по умолчанию переопределив unmarshal
// !! переопределение начинает игнорировать изночальные условие decoder.DisallowUnknownFields()
func (m *Manga) UnmarshalJSON(text []byte) error {
	type manga Manga
	opts := manga{
		Finish_date: pgtype.Timestamptz{Time: time.Now(), Valid: true},
		// Status: pgtype.Text{String: "continues", Valid: true},
	}

	if err := json.Unmarshal(text, &opts); err != nil {
		return err
	}
	*m = Manga(opts)
	return nil
}
