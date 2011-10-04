source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem "jquery-rails"
gem 'sorcery'
gem 'simple_form'
gem 'cocoon'
gem 'cancan'

gem 'thin'
gem 'heroku'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

group :development do
  gem "cucumber-rails"
  gem "capybara"
  gem "rspec-rails", ">= 2.0.1"
  gem 'sqlite3'
end

group :test do
  gem "cucumber-rails"
  gem "capybara"
  gem "rspec-rails", ">= 2.0.1"
  gem "database_cleaner"
  gem "spork", ">= 0.9.0.rc9"
  gem "factory_girl_rails"
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

gem 'therubyracer'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'