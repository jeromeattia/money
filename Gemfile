source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.13'
gem 'pg'
gem 'haml'
gem 'omniauth-facebook'
gem 'omniauth-identity'
gem 'foreman'
gem 'dotenv-rails'
gem "d3-rails"
gem 'thin'
gem 'gravatar_image_tag'
gem 'bcrypt-ruby'  , '~> 3.0.0'
gem "highcharts-rails", "~> 3.0.0"

group :production do
  gem 'unicorn'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'compass-rails' # you need this or you get an err
  gem 'zurb-foundation', '~> 4.0.0'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'rspec-rails', '2.11.0'
  gem 'annotate', '~> 2.4.1.beta' 
  gem 'faker'
  gem 'pry-rails'
  gem 'sextant'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  gem 'database_cleaner'
  gem "cucumber-rails", "1.3.0"  , :require => false
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem "minitest-reporters"
  gem "spork-rails"
end