package apiserver

import (
	"context"
	"errors"
	"log/slog"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/chi/v5"
	"github.com/omaily/MyPet-Rating/config"
	controller "github.com/omaily/MyPet-Rating/internal/controller/manga"
	"github.com/omaily/MyPet-Rating/internal/database"
	"github.com/omaily/MyPet-Rating/internal/myMiddleware"
)

type APIServer struct {
	conf    *config.HTTPServer
	storage *database.Storage
}

func NewServer(conf *config.HTTPServer, storage *database.Storage) (*APIServer, error) {
	if conf == nil {
		return nil, errors.New("configuration files are not initialized")
	}
	if conf.Address == "" || conf.Port == "" {
		return nil, errors.New("configuration address cannot be blank")
	}

	return &APIServer{
		conf:    conf,
		storage: storage,
	}, nil
}

func (s *APIServer) Start(logger *slog.Logger) error {

	ser := &http.Server{
		Addr:         s.conf.Port,
		Handler:      s.router(logger),
		ReadTimeout:  s.conf.Timeout * time.Second,
		WriteTimeout: s.conf.Timeout * 2 * time.Second,
		IdleTimeout:  s.conf.IdleTimeout * time.Second,
	}

	go func() {
		slog.Info("starting server", slog.String("addres", s.conf.Address))
		if err := ser.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			slog.Error("не маслает", slog.String("err", err.Error()))
		}
	}()

	//другой вариант принимать сигнал стоп в параметре функкции Start(stop <-chan struct{})
	stop := make(chan os.Signal, 1)
	signal.Notify(stop, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)

	<-stop

	slog.Info("stopping server due to syscall or collapse")
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	return ser.Shutdown(ctx)
}

func (s *APIServer) router(logger *slog.Logger) http.Handler {

	router := chi.NewRouter()

	router.Use(middleware.RequestID)
	router.Use(middleware.Recoverer)

	router.Use(myMiddleware.New(logger))            // переопределим встроенный middleware.Logger на свой
	router.Use(myMiddleware.CorsSettings().Handler) // настройки правил доступа

	controller.HandlersGlobal(router, s.storage)
	controller.HandlersSecure(router)

	return router
}
