source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Default Rails gems
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

# CRUD
gem 'kaminari'
gem 'simple_form'
gem 'has_scope'
gem 'twitter-bootstrap-rails'
gem 'slim-rails'
gem 'font-awesome-rails'

# testing nacha gems
gem 'ach'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Linter
  gem 'rubocop'

  # Errors
  gem 'better_errors'
  gem 'binding_of_caller'
end
