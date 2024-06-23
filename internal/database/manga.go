package database

import (
	"context"
	"errors"
	"fmt"
	"log/slog"

	"github.com/jackc/pgconn"
	"github.com/jackc/pgerrcode"
	"github.com/jackc/pgx/v5"
	"github.com/omaily/MyPet-Rating/api/model"
)

func sortingRules(condition []*model.Condition) string {

	circs := ""
	order := "order by rating desc"

	for _, v := range condition {

		if v.Name == "order" {
			sortingOrder := "asc"
			if v.Value[0] == "rating" { // Value[0] - потому что условий сортировки не может быть больше 1
				sortingOrder = "desc"
			}
			order = fmt.Sprintf("%s %s %s", "order by", v.Value[0], sortingOrder)
		}
	}
	return circs + " " + order
}

func (pg *Storage) ReadAllManga(ctx context.Context, condition []*model.Condition) ([]model.Manga, error) {

	query := `select id, title, title_en, author, rating, start_d as start_date, finish_d as finish_date, img from manga `
	orderBy := sortingRules(condition)

	rows, err := pg.conn.Query(ctx, query+orderBy)
	if err != nil {
		slog.Error("error while executing query:", err)
		return nil, err
	}
	defer rows.Close()

	return pgx.CollectRows(rows, pgx.RowToStructByName[model.Manga])
}

func (pg *Storage) ReadIdManga(ctx context.Context, id int) (model.Manga, []string, error) {

	var manga model.Manga
	var tags []string
	err := pg.conn.QueryRow(ctx,
		`SELECT a.id,
			a.title,
			a.title_en,
			a.author,
			a.rating,
			a.start_d AS start_date,
			a.finish_d AS finish_date,
			a.img,
			ARRAY_REMOVE(ARRAY_AGG(c.title), NULL)
		FROM manga AS a
		LEFT JOIN taxonomies AS b
			on a.id = b.title_id
		LEFT JOIN tags AS c 
			on b.tag_id = c.id
		WHERE a.id = $1
		GROUP BY a.id
		ORDER BY a.id`, id,
	).Scan(
		&manga.Id,
		&manga.Title,
		&manga.Title_en,
		&manga.Author,
		&manga.Rating,
		&manga.Start_date,
		&manga.Finish_date,
		&manga.Img,
		&tags,
	)

	if err != nil {
		fmt.Println("Error scanning row:", err)
		return manga, nil, err
	}

	return manga, tags, nil
}

// Объемные//Массовые вставки через pgx.Batch, pgx.BatchResult
// Показывает из за какой строки произошла ошибка, также возвращает присвоенные успешным строкам id
func (pg *Storage) BulkInsertManga(ctx context.Context, manga map[string]model.Manga) ([]int, error) {
	query := `INSERT INTO manga (title, title_en, author, rating, start_d, finish_d)
		VALUES (@title, @title_en, @author, @rating, @start_date, @finish_date)
		RETURNING id;`

	batch := &pgx.Batch{}
	for _, title := range manga {
		args := pgx.NamedArgs{
			"title":       title.Title,
			"title_en":    title.Title_en,
			"author":      title.Author,
			"rating":      title.Rating,
			"start_date":  title.Start_date,
			"finish_date": title.Finish_date,
			// "status":   title.Status,
			// "img":      title.Img,
		}
		batch.Queue(query, args)
	}
	results := pg.conn.SendBatch(ctx, batch)
	defer results.Close()

	var idRange = make([]int, len(manga))
	for _, title := range manga {
		var id int
		err := results.QueryRow().Scan(&id)
		if err != nil {
			var pgErr *pgconn.PgError
			if errors.As(err, &pgErr) && pgErr.Code == pgerrcode.UniqueViolation { // ошибку уникальности полей
				slog.Error("error field uniqueness ", title.Title)
			}
			return nil, fmt.Errorf("unable to insert row: %w", err)
		}
		idRange = append(idRange, id)
	}
	return idRange, nil
}

func (pg *Storage) CopyInsertManga(ctx context.Context, manga map[string]model.Manga) error {

	entries := [][]any{}
	columns := []string{"title", "title_en", "author", "rating", "start_d", "finish_d"}
	tableName := "manga"

	for _, title := range manga {
		entries = append(entries, []any{title.Title, title.Title_en, title.Author, title.Rating, title.Start_date, title.Finish_date})
	}

	_, err := pg.conn.CopyFrom(
		ctx,
		pgx.Identifier{tableName},
		columns,
		pgx.CopyFromRows(entries),
	)

	if err != nil {
		return fmt.Errorf("error copying into %s table: %w", tableName, err)
	}

	return nil
}

// ReadAll: 			GET  /items			 получить все существующие элементы в списке
// ReadID: 				GET  /items/{itemId} получить один элемент из списка, используя его идентификатор
// CopyFromManga:  		POST /items 		 добавить элементы в список
// BulkInsertManga: 	POST /items 		 добавить элементы в список

// TODO: 				POST 	/items 			добавить 1 элемент в список
// TODO: 				PUT 	/items/{itemId} обновить существующий элемент
// TODO: 				PUT 	/items/{itemId} обновить multiple элементы
// TODO: 				DELETE 	/items/{itemId}	удалить элемент из списка
