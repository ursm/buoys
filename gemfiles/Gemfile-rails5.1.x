source 'https://rubygems.org'

gem 'rails', '~> 5.1.0'
gem 'sqlite3'

gem 'buoys', path: '../'

group :test do
  gem 'rubocop', '~> 0.54'
end
