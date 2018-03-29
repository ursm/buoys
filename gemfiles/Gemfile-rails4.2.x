source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'
gem 'sqlite3'

gem 'buoys', path: '../'

group :test do
  gem 'rubocop', '~> 0.54'
end
