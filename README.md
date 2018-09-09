# Grains

Grains - это "заготовка" для быстрого старта проекта.

При написании нового проекта некоторые операции приходится повторять из раза в раз, например: создание пользователей, групп, авторизация, подготовка к тестированию и развертыванию. Часто проект состоит трёх макетов (layout): (1) публичная часть, лендинг (2) приватная часть, многопользовательская бизнес-логика, (3) набор шаблонов для авторизации, восстановления и изменения пароля. Кроме того, требуется подключение механизма cms для административного управления сущностями бизнес-логики, а также контентом сайта. Плюс тестирование, развертывание, контейнеризация и прочее, прочее, прочее...


Grains ставит своей целью хоть немного сэконимить время на создание нового проекта.


Структура проекта:

* 3 макета (layout): */views/layout/application.html.erb* - макет для многопользовательской бизнес-логики проекта, по сути - основная часть проекта; */view/layout/pages.html.erb* - публичные страницы проекта: "домашная", "контакты", "о компании" и т.д; */views/layout/devise.html.erb* - макет для функционала аутентификации.
* сконфигурированная [devise](https://github.com/plataformatec/devise)
* использование CMS [active_admin](https://github.com/activeadmin/activeadmin)
* реализация бизнес-логики с использованием [interactor](https://github.com/collectiveidea/interactor)
* [rspec](https://github.com/rspec/rspec-rails) тестирование
* использование [fontawesome](https://fontawesome.com/?from=io) версии 5
* развертывание с использованием [capistrano](https://github.com/capistrano/capistrano)
* контроль оформления кода с [rubocop](https://github.com/rubocop-hq/rubocop)

## Версии

Ruby 2.5.1

Rails 5.2.1

## Как использовать

```bash
# создаем директорию для нашего проекта
mkdir my-pro
# клонируем заготовку
git clone ...
# обновляем окружение
bundle update
yarn upgrade
# создаем БД (postgresql)
cp config/database.yml.example config/database.yml
# корректируем config/database.yml
bin/rails db:create
bin/rails db:schema:load
# запускаем сервер Rails
bin/rails s

# загружаем проект в свой репозиторий
rm -rf .git
git init
git commit -m "initial commit"
git remote add ...
git push -u origin master
```

## Развертывание

Развертывание проекта осуществляется средствами библиотеки [capistrano](https://github.com/capistrano/capistrano).

Необходимо скорректировать файлы *config/deploy.rb*,  *config/deploy/staging.rb*, *config/deploy/production.rb* в соответствии с настройками сервера.

```bash
# выгружаем конфигурацию
# см. lib/capistrano/tasks/setup.rake
cap staging setup:upload_conf
# запускаем развертывание
```


## Тестирование

```bash
rspec spec
```


