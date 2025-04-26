package handler

import (
	"backend-api/internal/model"
	"log"
	"time"

	"github.com/labstack/echo/v4"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

func Users(c echo.Context) error {
	dsn := "host=database user=postgres password=postgrespassword dbname=postgres port=5432 sslmode=disable TimeZone=Asia/Tokyo"
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		log.Fatal("DB接続失敗:", err)
	}
	log.Println("✅ DB接続成功")

	newUser := model.User{
		Name:          "山田花子",
		Email:         "hanako@example.com",
		LoginID:       "hanako123",
		LoginPassword: "secret123",
		Created:       time.Now(),
		Updated:       time.Now(),
	}

	if err := db.Create(&newUser).Error; err != nil {
		log.Fatal("ユーザー登録失敗:", err)
	}
	log.Println("ユーザー登録成功")
	return c.String(200, "ユーザー登録成功")
}
