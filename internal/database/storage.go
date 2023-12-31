package database

import (
	"context"
	"fmt"
	"sync"

	"github.com/jackc/pgx/v5/pgxpool"
	"gitlab.com/oldmas/mypet-rating/config"
)

type Storage struct {
	conn *pgxpool.Pool
	// conf *config.Storage
}

var (
	pgInstance *Storage
	pgOnce     sync.Once
)

func NewStorage(ctx context.Context, cs *config.Storage) (*Storage, error) {
	pgOnce.Do(func() {
		pool, err := pgxpool.New(ctx, fmt.Sprintf("postgres://%s:%s@%s/%s" /*"postgres://%s:%s@%s:%v/%s"*/, (*cs).Role, (*cs).Pass, (*cs).Host /*(*cs).Port, */, (*cs).Database))
		if err != nil {
			fmt.Errorf("unable to create connection pool: %w", err)
			return
		}
		pgInstance = &Storage{conn: pool}
	})
	return pgInstance, nil
}
