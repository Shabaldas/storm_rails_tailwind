source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'activeadmin'
gem 'active_skin'
gem 'ancestry'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'foreman'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'dotenv-rails', '~> 2.7'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'friendly_id', '~> 5.4.0'
gem 'seedbank'
gem 'simple_form'
gem 'slim-rails'
gem 'rails-i18n'

# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
  gem 'rails-controller-testing'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'simplecov', require: false
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "hotwire-rails", "~> 0.1.3"
