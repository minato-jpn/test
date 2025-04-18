package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {

	//entryポイントとしてアクセスされた場合のhandlerへのルーティングを定義

	e := echo.New()

	// ルートエンドポイント
	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, Echo in Docker!")
	})

	// サーバーを起動
	e.Start(":8081")
}
