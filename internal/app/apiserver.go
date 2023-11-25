package apiserver

import (
	"context"
	"errors"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"gitlab.com/oldmas/mypet-rating/config"
	"gitlab.com/oldmas/mypet-rating/internal/database"
	"golang.org/x/exp/slog"
)

type APIServer struct {
	storage *database.Storage
	conf    *config.HTTPServer
	log     *slog.Logger
}

func NewAPIServer(conf *config.HTTPServer, log *slog.Logger, storage *database.Storage) (*APIServer, error) {
	if conf.Address == "" || conf.Port == "" {
		return nil, errors.New("address cannot be blank")
	}

	return &APIServer{
		storage: storage,
		conf:    conf,
		log:     log,
	}, nil
}

func (s *APIServer) Start() error {
	ser := &http.Server{
		// Addr:         cfg.Address + cfg.HTTPServer.Port,
		Addr:         s.conf.Port,
		Handler:      s.router(),
		ReadTimeout:  s.conf.Timeout * time.Second,
		WriteTimeout: s.conf.Timeout * 2 * time.Second,
		IdleTimeout:  s.conf.IdleTimeout * time.Second,
	}

	go func() {
		s.log.Info("starting server", slog.String("addres", s.conf.Address))
		if err := ser.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			s.log.Error("фатал нахуй")
		}
	}()

	//другой вариант принимать сигнал стоп через канал для чтения
	//в параметре функкции Start(stop <-chan struct{})
	stop := make(chan os.Signal, 1)
	signal.Notify(stop, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)
	var timeDefolt = 5 * time.Second

	<-stop

	s.log.Info("stopping server", slog.String("timeout", timeDefolt.String()))
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	return ser.Shutdown(ctx)
}

func (s *APIServer) router() http.Handler {

	router := chi.NewRouter()
	router.Use(middleware.RequestID)
	router.Use(middleware.Recoverer)
	router.Use(New(s.log)) // переопределим встроенный middleware.Logger на свой

	router.Get("/manga", s.readObj())    // listItems
	router.Post("/manga", s.insertObj()) // createItem
	router.HandleFunc("/", s.defaultRoute)
	return router
}

func (s *APIServer) defaultRoute(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Hello World"))
}
