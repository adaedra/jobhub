# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise', '~> 4.7.1'
gem 'jbuilder', '~> 2.7'
gem 'jwt', '~> 2.2'
gem 'mini_racer', '~> 0.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'rbnacl', '~> 7.1'
gem 'react_on_rails', '~> 11.3'
gem 'sass-rails', '>= 6'
gem 'validate_url', '~> 1.0'
gem 'webpacker', '~> 4.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '3.31.0', require: false
  gem 'selenium-webdriver', '~> 3.142'
  gem 'fabrication', '~> 2.21'
  gem 'faker', '~> 2.10'
  gem 'rspec-rails', '~> 4.0.0.rc1'

  gem 'rubocop', '~> 0.80', require: false
  gem 'rubocop-rails', '~> 2.4', require: false
  gem 'rubocop-rspec', '~> 1.38', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
