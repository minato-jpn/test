package main

import (
	// handlerパッケージをインポート
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {

	//entryポイントとしてアクセスされた場合のhandlerへのルーティングを定義

	e := echo.New()

	// ルートエンドポイント
	e.GET("/", func(c echo.Context) error {
		return c.Redirect(http.StatusMovedPermanently, "/hello")
	})

	e.GET("/hello", func(c echo.Context) error {
		return c.String(http.StatusOK, "Hello, World!")
	})

	// サーバーを起動
	e.Start(":8081")
}
