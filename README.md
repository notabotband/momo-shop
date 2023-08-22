# Momo Store aka Пельменная №2

<img width="900" alt="image" src="https://user-images.githubusercontent.com/9394918/167876466-2c530828-d658-4efe-9064-825626cc6db5.png">

http://momo.myvalue.ru

## Запуск приложения

### 1. Создайте виртуальную машину в Яндекс.Облаке

создайте с помощью Terraform необходимую инфраструктуру в Яндекс.Облаке
```bash
cd terraform
terraform apply
```

перед этим нужно добавить переменные окружения:
ключ к хранилищу S3 в Яндекс.Облаке, в котором будет хранится состояние Terraform
```bash
export AWS_ACCESS_KEY_ID="<идентификатор_ключа>"
export AWS_SECRET_ACCESS_KEY="<секретный_ключ>"
```

### 2. Картинки хранятся в S3 Яндекс.Облока, бакет "momobucket" создается terraform

# Структура проекта 

```bash
|
├── backend                       - приложение бэкенда на GO, Dockerfile, gitlab-ci.yml
├── frontend                      - приложение фронтэнда на VUE, Dockerfile, gitlab-ci.yml
├── terraform                     - terraform для развертывания BM
├── deploy-frontend.sh            - docker-compose up -d frontend
├── deploy-backend.sh             - ocker-compose up -d backend-green, backend-blue
├── .gitlab-ci.yml                - родительский пайплайн для сборки и релиза образов бэкенда и фронтенда в Container Registry
```

## Тестирование
Для тестирования исподьзуется
SonarQube
https://sonarqube.praktikum-services.ru/projects/favorite

## Docker
Docker images хранятся в Container Registry gitlab

## Docker-compose
Используется docker-compose.yml 
Контейнер Nginx вместо фронтенда настроен как балансировщик. 
Возможность масштабировать бэкенд.
Конфигурационный файл Nginx формируется динамически в зависимости от количества работающих экземпляров бекэнда. 
Шаблон конфига лежат по пути /app/nginx.tmpl.

## Деплой происходит по кнопке(Manual deploys)

## Локальный запуск приложения
### Frontend

```bash
npm install
NODE_ENV=production VUE_APP_API_URL=http://localhost:8081 npm run serve
```

### Backend

```bash
go run ./cmd/api
go test -v ./... 
```
