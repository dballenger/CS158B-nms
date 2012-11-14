source 'https://rubygems.org'

gem 'rails', '3.2.8'

gem 'sqlite3'

gem "snmp"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem 'test-unit'
  
  # Auto testing for continuous testing on the local environment
  gem 'autotest-standalone'
  gem 'autotest-rails-pure'
  gem 'zentest-without-autotest'
  
  # The following two gems only work on OS X.  fsevent subscribes to notifications about file changes (vs polling) and growl provides integrated growl notifications of test success status
  gem 'autotest-fsevent'
  gem 'autotest-growl'
end