# Momo Store aka Пельменная №2

<img width="900" alt="image" src="https://user-images.githubusercontent.com/9394918/167876466-2c530828-d658-4efe-9064-825626cc6db5.png">

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

### 2. Создайте в облаке хранилище с именем "momo-pictures"

и загрузите туда картинки пельменей
(в данном проекте это хранилище создается терраформом)

<img width="900" alt="image" src="https://github.com/Zhihareff/momo-store/raw/main/image/s3-bucket.png">


# Структура проекта 

```bash
|
├── backend                       - приложение бэкенда на GO, Dockerfile, gitlab-ci.yml
├── frontend                      - приложение фронтэнда на VUE, Dockerfile, gitlab-ci.yml
├── terraform                     - terraform для развертывания BM
├── .gitlab-ci.yml                - родительский пайплайн для сборки и релиза образов бэкенда и фронтенда в Container Registry
```

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




## Инфраструктура приложения

Dockerfile'ы для сборки Docker-образов бэкенда и фронтенда
Бэкенд: бинарный файл Go в Docker-образе
Фронтенд: HTML-страница раздаётся с Nginx

Для тестирования исподьзуется
SonarQube
https://sonarqube.praktikum-services.ru/projects/favorite