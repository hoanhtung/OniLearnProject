source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'font-awesome-rails'

gem 'simple_token_authentication', '~> 1.0'
#image
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 4.3'

#paginatable
gem 'kaminari'
gem 'bootstrap4-kaminari-views'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'boostrap-sass', '~> 0.0.2'
gem 'bootstrap', '~> 4.0.0'
#Api gems
gem 'active_model_serializers'
#user
gem 'devise'
gem 'omniauth-google-oauth2'
gem 'omniauth'
gem 'omniauth-facebook'

gem 'firebase', '~> 0.2.8'

gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false


group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg', '0.20.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
