package database

import (
	"context"
	"fmt"
	"log/slog"
	"sync"

	"github.com/jackc/pgx/v5/pgxpool"
	"github.com/omaily/MyPet-Rating/config"
)

type Storage struct {
	conn *pgxpool.Pool
}

var pgInstance *Storage
var pgOnce sync.Once

func NewStorage(ctx context.Context, cs *config.Storage) (*Storage, error) {
	pgOnce.Do(func() {
		pool, err := pgxpool.New(ctx, fmt.Sprintf("postgres://%s:%s@%s/%s", (*cs).Role, (*cs).Pass, (*cs).Host /*,(*cs).Port*/, (*cs).Database))
		if err != nil {
			slog.Error("unable to create connection pool: %w", err)
			return
		}
		pgInstance = &Storage{conn: pool}
	})
	return pgInstance, nil
}
