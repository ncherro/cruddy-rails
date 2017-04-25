# Rails CRUD :pray:

This is a Rails 5 example app to show off quick and dirty CRUD functionality
using

Uses the following gems for quick CRUD:

- kaminari
- simple\_form
- has\_scope
- twitter-bootstrap-rails
- slim-rails
- font-awesome-rails

Uses these gems for easy development:

- rubocop
- better\_errors
- binding\_of\_caller

## Setup (with docker)

- `docker-compose build`
- `docker-compose run app bundle`
- `docker-compose run app bundle exec rails db:create`
- `docker-compose run app bundle exec rails db:reset`
- `docker-compose up`

Then visit http://dockerhost:3000, where `dockerhost` points to your
`docker-machine ip`

## Scaffolded files

These commands were run to scaffold some views

- `docker-compose run app bundle exec rails g bootstrap:layout`
- `docker-compose run app bundle exec rails g simple_form:install --bootstrap`
- `docker-compose run app bundle exec rails generate kaminari:views bootstrap3`
