# Указывать версию Ruby в Gemfile является плохой практикой, так как вы не можете
#   указать различные версии на вермя тестирования и разработки. Однако, когда речь идет о
#   простейшем приложении этот способ является самым простым.
ruby "2.3.1"

source 'https://rubygems.org'

gem 'rails', '4.2.7.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

gem "therubyracer"

# Для придания нашему проекту современного облика мы используем Frontend Framework
#   Bootstrap 3 (http://getbootstrap.com/)
#   Данный Framework содержит библиотеку CSS стилей для всевозможных HTML элементов, таких как
#     формы, кнопки, таблицы и так далее.
#   Также данный Framework'ом приспособлен к созданию "резинового" (адаптивного к разным разрешениям экрана)
#     дизайна, что даст нам возможность отобразить сайт в "приличном" виде на мобильных устройствах.
gem "twitter-bootstrap-rails"
gem 'devise-bootstrap-views'

# Модуль авторизации
gem 'devise'
gem 'devise-i18n'

# Модуль базы данных
gem 'sqlite3', group: [:development, :test]
# SQLite является примитивной СУБД, однако идеально подходит для маленький, нетребовательных проектов или
#   во время разработки
gem 'pg', group: :production

# Модуль корзины
#gem 'online_cart', git: 'https://github.com/developer88/online_shop_cart_book.git'

# Production версия нашего магазина распологается на хостинге Heroku
# Для полноценной работы требуется использовать данный gem
gem 'rails_12factor', group: :production

# Для отправки писем в production среде (Heroku) мы используем сервис
# TODO: !!!!! fix this
gem 'sendgrid-ruby', group: :production

group :development do
  gem 'web-console', '~> 2.0'
  gem 'letter_opener'
end
