package storage

import (
	"context"
	"errors"
	"fmt"
	"log"

	"github.com/jackc/pgconn"
	"github.com/jackc/pgerrcode"
	"github.com/jackc/pgx/v5"
	"gitlab.com/oldmas/api-protobuf/model"
)

func (pg *Storage) ReadAllManga(ctx context.Context) ([]model.Manga, error) {
	query := `select 
	id, 
	title, 
	title_en, 
	author,
	rating, 
	start_d as start_date,     
	finish_d as finish_date
    from  manga order by rating desc`
	rows, err := pg.conn.Query(ctx, query)
	if err != nil {
		log.Fatal("error while executing query: ", err)
	}
	defer rows.Close()

	return pgx.CollectRows(rows, pgx.RowToStructByName[model.Manga])
}

// Объемные//Массовые вставки через pgx.Batch, pgx.BatchResult
// Показывает из за какой строки произошла ошибка, также возвращает присвоенные успешным строкам id
func (pg *Storage) BulkInsertManga(ctx context.Context, manga map[string]model.Manga) ([]int, error) {
	query := `INSERT INTO manga (title, title_en, author, rating, start_d, finish_d, status)
		VALUES (@title, @title_en, @author, @rating, @start_date, @finish_date, @status)
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
			if errors.As(err, &pgErr) && pgErr.Code == pgerrcode.UniqueViolation { //ошибку уникальности полей
				log.Printf("error field uniqueness %v", title.Title)
			}
			return nil, fmt.Errorf("unable to insert row: %w", err)
		}
		idRange = append(idRange, id)
	}
	return idRange, nil
}

func (pg *Storage) CopyInsertManga(ctx context.Context, manga map[string]model.Manga) error {

	entries := [][]any{}
	columns := []string{"title", "title_en", "author", "rating", "start_d", "finish_d", "status"}
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

// ReadAll: 			GET  /items	получить все существующие элементы в списке
// CopyFromManga:  		POST /items добавить элементы в список
// BulkInsertManga: 	POST /items добавить элементы в список

// TODO: GET 	/items/{itemId} получить один элемент из списка, используя его идентификатор
// TODO: POST 	/items 			добавить 1 элемент в список
// TODO: PUT 	/items/{itemId} обновить существующий элемент
// TODO: PUT 	/items/{itemId} обновить multiple элементы
// TODO: DELETE /items/{itemId}	удалить элемент из списка
