source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "action_policy"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "decent_exposure", "~> 3.0"
gem "enumerize"
gem "interactor"
gem "jbuilder", "~> 2.7"
gem "pagy"
gem "pg"
gem "progressbar"
gem "puma", ">= 5.6.4"
gem "rails", "~> 6.1.0"
gem "responders"
gem "sass-rails", ">= 6"
gem "seedbank"
gem "sidekiq", "~> 6.4"
gem "simple_form"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker", "~> 4.0"

group :test do
  gem "capybara-email"
  gem "formulaic"
  gem "simplecov", require: false
end

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "capybara", require: false
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-i18n", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-thread_safety", require: false
  gem "shoulda-matchers"
end

group :development do
  gem "letter_opener"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
