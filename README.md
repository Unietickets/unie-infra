# Unie Infrastructure

Инфраструктурный репозиторий для проекта Unie, содержащий Docker конфигурации и сервисы как подмодули.

## Структура репозитория

- `/docker` - Docker Compose конфигурации и окружения
- `/services` - Сервисы как Git подмодули
  - `/services/unie` - Основной сервис Unie
  - `/services/balance-service` - Сервис баланса
  - `/services/smtp-service` - SMTP сервис

## Начало работы

1. Клонируйте репозиторий с подмодулями:
`git clone --recursive https://github.com/Unietickets/unie-infra.git cd unie-infra`

2. Или, если вы уже клонировали репозиторий без подмодулей:
```
git submodule foreach git pull origin master
git add .
git commit -m "Update all submodules to the latest commits on master."
git push
```

3. Запустите скрипт инициализации:
`./docker/setup.sh`

### Разработка
./docker:
`docker-compose -f docker-compose.yml -f docker-compose.dev.yml --env-file .env.development up`

### Продакшн
./docker:
`docker-compose -f docker-compose.yml -f docker-compose.prod.yml --env-file .env.production up -d`


## Обновление подмодулей

Для обновления всех подмодулей до последних версий:
`git submodule update --remote`

Для обновления конкретного подмодуля:
`cd services/unie git checkout main git pull cd ../.. git add services/unie git commit -m "Update unie service to latest version"`