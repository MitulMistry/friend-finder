source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Kaminari For pagination
gem 'kaminari', '~> 1.2', '>= 1.2.1'
# Use Faker to generate example data
gem 'faker', '~> 2.14'
# Add validations for Active Storage images
gem 'active_storage_validations', '~> 0.9.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Use RSpec for testing
  gem 'rspec-rails', '~> 5.0', '>= 5.0.2'
  # Include REXML as RSpec dependency for Ruby 3+
  gem 'rexml', '~> 3.2', '>= 3.2.4'
  # Use Factory Bot to generate model instances for tests
  gem 'factory_bot_rails', '~> 6.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # Use Annotate to print out schema on model files
  gem 'annotate'
  # Replace the standard Rails error page
  gem 'better_errors'
  # Binding of Caller will open interactive REPL when application crashes
  gem 'binding_of_caller'
  # Use Pry instead of IRB for Rails console
  gem 'pry-rails'
  # Automatically run RSpec tests
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # Use one-line matchers for RSpec testing
  gem 'shoulda-matchers', '~> 5.0'
  # Launch external browser with Capybara tests
  gem 'launchy', '~> 2.5'
  # Clean databases for testing
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # Bring back assigns and assert_template for controller testing
  # gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
