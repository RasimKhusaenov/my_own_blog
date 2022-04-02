source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.4.2", require: false
gem "jbuilder", "~> 2.7"
gem "pg"
gem "puma"
gem "pundit", "~> 2.2"
gem "rails", "~> 6.0.4.7"
gem "sass-rails", ">= 6"
gem "simple_form"
gem "slim-rails"
gem "turbolinks", "~> 5"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "webpacker", "~> 4.0"

group :test do
  gem "formulaic"
  gem "pundit-matchers"
  gem "simplecov", require: false
end

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara", require: false
  gem "factory_bot_rails"
  gem "faker"
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
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
