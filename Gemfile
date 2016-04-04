source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'pg'

# active admin dependencies
gem 'devise'
gem 'cancan' # or cancancan
gem 'draper'
gem 'pundit'
# Gemfile in Rails >= 3.1
gem 'activeadmin', github: 'activeadmin'
gem 'shoulda-matchers'

# API Serialization
gem 'active_model_serializers'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem 'ffaker'
end

# Sabisu_rails is for API testing
gem 'sabisu_rails', github: "IcaliaLabs/sabisu-rails"
gem 'compass-rails'
gem 'furatto'
gem 'font-awesome-rails'
gem 'simple_form'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  #gem 'web-console', '~> 2.0'
  # Better errors will do exactly what you would think.  It gives you better errors!
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rails_12factor', '0.0.2'
  gem 'puma',           '3.1.0'
end
