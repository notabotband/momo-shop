FROM golang:1.17 as builder
ARG VERSION=${VERSION}
LABEL name="momo-backend" \
      version=${VERSION}
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o api ./cmd/api
FROM alpine:latest
WORKDIR /root
RUN apk --no-cache add curl
COPY --from=builder /app/api .
EXPOSE 8081
CMD ["./api"]
