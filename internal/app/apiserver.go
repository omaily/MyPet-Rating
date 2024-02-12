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
	midORfid "github.com/omaily/MyPet-Rating/internal/app/myMiddleware"
	"github.com/omaily/MyPet-Rating/internal/database"
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
			slog.Error("не маслает", slog.StringValue(err.Error()))
		}
	}()

	//другой вариант принимать сигнал стоп через канал для чтения
	//в параметре функкции Start(stop <-chan struct{})
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

	router.Use(midORfid.New(logger))            // переопределим встроенный middleware.Logger на свой
	router.Use(midORfid.CorsSettings().Handler) // настройки правил доступа

	router.Get("/manga", s.readObj())    // listItems
	router.Post("/manga", s.insertObj()) // createItem
	router.HandleFunc("/", s.defaultRoute)
	return router
}

func (s *APIServer) defaultRoute(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Hello World"))
}
