# Rails CRUD :pray:

This is a Rails 5 example app to show off quick and dirty CRUD functionality
using

- bootstrap
- simple\_form
- kaminari
- has\_scope slim-rails

## Setup (with docker)

- `docker-compose build`
- `docker-compose run app bundle`
- `docker-compose run app bundle exec rails db:reset`
- `docker-compose up`

Then visit http://dockerhost:3000, where `dockerhost` points to your
`docker-machine ip`

## Scaffolded files

These commands were run to scaffold some views

- `docker-compose run app bundle exec rails g bootstrap:layout`
- `docker-compose run app bundle exec rails g simple_form:install --bootstrap`
- `docker-compose run app bundle exec rails generate kaminari:views bootstrap3`
