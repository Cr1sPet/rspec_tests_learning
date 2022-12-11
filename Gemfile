# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

group :test do
  gem 'rspec', '~> 3.10'
end

gem 'pry-byebug'

group :development do
  gem 'rubocop', '~> 1.40', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec'
end
