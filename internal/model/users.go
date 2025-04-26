package model

import "backend-api/api"

type User api.User

func (User) TableName() string {
	return "Users" // ← テーブル名と完全一致させる（大文字・クオートあり）
}
