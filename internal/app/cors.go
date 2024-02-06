// r := httprouter.New()
// StartRoutes(r)
// th := controller.Handler{}
// th.Register(r)

// //прикрепляемся к хосту и свободному порту для приема и обслуживания входящих запросов
// //вторым параметром передается роутер, который будет работать с запросами
// corsSettings := controller.CorsSettings()

package apiserver

import (
	"github.com/go-chi/cors"
)

func CorsSettings() *cors.Cors {
	return cors.New(cors.Options{
		AllowedMethods: []string{"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD"},
		AllowedOrigins: []string{
			"http://localhost:3000",
		},
		AllowCredentials:   true,
		AllowedHeaders:     []string{},
		OptionsPassthrough: true,
		ExposedHeaders:     []string{},
		Debug:              true,
	})
}
