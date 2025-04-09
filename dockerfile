# ベースイメージに Go を使用
FROM golang:1.20 AS builder

# 作業ディレクトリを設定
WORKDIR /app

# 先に go.mod と go.sum をコピーしてキャッシュ活用
COPY go.mod go.sum ./

# 依存を先に取得
RUN go mod download

# ソースコードをコピー
COPY . .

# アプリをビルド
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /app/test .

# 実行用の軽量イメージを作成
FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/test .

EXPOSE 8081

CMD ["./test"]