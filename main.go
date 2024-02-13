package main

import (
	"context"
	"log/slog"
	"os"

	"github.com/omaily/MyPet-Rating/config"
	server "github.com/omaily/MyPet-Rating/internal/app"
	storage "github.com/omaily/MyPet-Rating/internal/database"
)

var (
	logger *slog.Logger
)

func init() {
	logger = slog.New(
		slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelDebug}),
		// slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{AddSource: true, ReplaceAttr: func(groups []string, a slog.Attr) slog.Attr {
		// 	if a.Key == slog.SourceKey {
		// 		source := a.Value.Any().(*slog.Source)
		// 		source.File = filepath.Base(source.File)
		// 	}
		// 	return a
		// }}),
	)
	slog.SetDefault(logger)
}

func main() {
	conf := config.MustLoad()

	storg, err := storage.NewStorage(context.Background(), &conf.Storage)
	if err != nil {
		logger.Error("could not initialize storage: %w", err)
		return
	}

	serv, err := server.NewServer(&conf.HTTPServer, storg)
	if err != nil {
		logger.Error("could not initialize chi-router: %w", err)
	}

	serv.Start(logger)
}
