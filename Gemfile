source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'stripe'
gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'jquery-rails'
gem 'friendly_id', '~> 5.1.0'
gem "paperclip", "~> 5.0.0"
gem 'chart-js-rails'
gem 'cloudinary'
gem 'figaro'
gem 'will_paginate', '~> 3.1.0'
gem 'carrierwave'
gem 'active_model_serializers', '~> 0.10.0'
gem 'omniauth-twitter'
gem 'twitter'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rspec-pride', '~> 3.2', '>= 3.2.1'
  gem 'pry-rails'
 gem 'poltergeist'

  gem 'capybara'
  gem "factory_bot_rails"
  gem 'database_cleaner'
  gem 'pry'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'launchy'
  gem 'orderly'
  gem 'faker'
  gem 'simplecov'
  gem 'coveralls', require: false
  gem 'travis'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
