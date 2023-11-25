package main

import (
	"context"
	"fmt"
	"os"
	"path/filepath"

	"github.com/urfave/cli/v2"
	"gitlab.com/oldmas/mypet-rating/config"
	apiserver "gitlab.com/oldmas/mypet-rating/internal/app"
	storage "gitlab.com/oldmas/mypet-rating/internal/database"
	"golang.org/x/exp/slog"
)

type launchSpace string

const (
	envLocal launchSpace = "local"
	envDev   launchSpace = "dev"
	envProd  launchSpace = "prod"
)

func main() {
	if err := app(config.MustLoad()).Run(os.Args); err != nil {
		fmt.Println(err)
	}
}

func app(conf *config.Config) *cli.App {
	var log *slog.Logger
	return &cli.App{
		EnableBashCompletion: true,
		Name:                 "api-server",
		Usage:                "The API",
		Commands: []*cli.Command{
			startCli(conf, log),
		},
	}
}

func FlagStartComand() []cli.Flag {
	return []cli.Flag{
		// &cli.StringFlag{
		// Name: apiServerAddrFlagName,
		// EnvVars: []string{"API_SERVER_ADDR"}},
		&cli.StringFlag{
			Name:    "env",
			Aliases: []string{"l"},
			Usage:   "language for the greeting",
		},
	}
}

func startCli(conf *config.Config, log *slog.Logger) *cli.Command {
	return &cli.Command{
		Name:  "start",
		Usage: "production level of the launched service",
		Flags: FlagStartComand(),
		Action: func(cCtx *cli.Context) error {

			// инициализируем логгер
			if !cCtx.IsSet("env") {
				log = setupConfLogger(conf.Env)
			} else {
				if log = setupConfLogger(cCtx.String("env")); log == nil {
					fmt.Println("argument env can only take values: local, dev, prod")
					log = setupConfLogger(conf.Env)
				}
			}

			// запускаем cервер
			st, err := storage.NewStorage(context.Background(), &conf.Storage)
			if err != nil {
				return fmt.Errorf("could not initialize storage: %w", err)
			}
			srv, err := apiserver.NewAPIServer(&conf.HTTPServer, log, st)
			if err != nil {
				return err
			}

			return srv.Start()
		},
	}
}

func setupConfLogger(env string) (log *slog.Logger) {
	switch launchSpace(env) {
	case envLocal:
		log = slog.New(
			slog.NewTextHandler(os.Stdout, &slog.HandlerOptions{
				Level:     slog.LevelDebug,
				AddSource: true, // получаем полный путь "source":{"function":"main.main","file":"./main.go","line":14}
				ReplaceAttr: func(groups []string, a slog.Attr) slog.Attr { //  относительный путь пректа
					if a.Key == slog.SourceKey {
						source := a.Value.Any().(*slog.Source)
						source.File = filepath.Base(source.File)
					}
					return a
				},
			}),
		)
	case envDev:
		log = slog.New(
			slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelDebug}),
		)
	case envProd:
		log = slog.New(
			slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: slog.LevelInfo}),
		)
	default:
		return nil
	}
	return log
}
