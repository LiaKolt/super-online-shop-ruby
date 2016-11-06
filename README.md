# Интернет-магазин SuperOnlineShop

Ruby on Rails приложение интернет-магазина SuperOnlineShop. Данная версия интернет магазина доступна [онлайн](https://super-online-shop.herokuapp.com/). Доступ к административной панели:

```
url: https://super-online-shop.herokuapp.com/admin/goods
логин: admin@admin.com
пароль: .test.
```

## История версий

Смотрите историю версий в отдельном [файле](CHANGELOG.md)

## Установка

Установите требуемые gems:

```
bundle install
```

Инициализируйте базу данных и выполните миграции:

```
rake db:create
rake db:migrate
```

## Использование

Просто запустите web-server:

```
rails s
```

## Что дальше?

Репозиторий содержит `TODO` с идеями и советами о том, как можно улучшить данное приложение. Чтобы быстро отобразить все `TODO` записи, воспользуйтесь коммандой:

```
rake notes
```

Однако, данная команда отобразит `TODO` только в `*.rb` файлах. Воспользуйтесь поиском в вашей IDE для отображения всех `TODO` меток в проекте или пройдите по [ссылке](https://github.com/developer88/super-online-shop-ruby/search?utf8=✓&q=TODO&type=Code)

## The MIT License (MIT)

Детали [тут](LICENSE.md)
