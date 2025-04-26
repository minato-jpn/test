package api

import (
	"time"
)

type User struct {
	ID            uint      `gorm:"column:id;primaryKey"`
	Name          string    `gorm:"column:name;not null"`
	Email         string    `gorm:"column:email;not null"`
	LoginID       string    `gorm:"column:login_id;not null"`
	LoginPassword string    `gorm:"column:login_password;not null"` // ← ここ重要！
	Created       time.Time `gorm:"column:created;autoCreateTime"`
	Updated       time.Time `gorm:"column:updated;autoCreateTime"`
}
