source 'https://rubygems.org'


gem 'rails', '4.2.5.1'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# フロントエンドのパッケージ管理にはbowerを使用
gem "bower-rails"

# Devise
gem 'devise'

group :development, :test do
  gem 'faker',        '1.4.2'

  gem "pry-byebug"
  gem "pry-coolline"
  gem "pry-rails"

  gem "rspec-rails", "~> 3.1.0"
  gem 'spring'
  gem 'sqlite3',     '1.3.9'
end

group :development do
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'puma',           '2.11.1'
end

group :test do
  gem "capybara"
  gem "factory_girl_rails", "~> 4.4.1"
end