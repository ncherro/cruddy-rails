# Rails CRUD :pray:

This is a Rails 5 example app to show off quick and dirty CRUD functionality.

Uses the following gems for quick CRUD:

- [kaminari](https://github.com/kaminari/kaminari)
- [simple\_form](https://github.com/plataformatec/simple_form)
- [has\_scope](https://github.com/plataformatec/has_scope)
- [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)
- [slim-rails](https://github.com/slim-template/slim-rails)
- [font-awesome-rails](https://github.com/bokmann/font-awesome-rails)

Uses these gems for development support:

- [rubocop](https://github.com/bbatsov/rubocop)
- [better\_errors](https://github.com/charliesome/better_errors)
- [binding\_of\_caller](https://github.com/banister/binding_of_caller)

## Setup (with docker)

- `docker-compose build`
- `docker-compose run app bundle`
- `docker-compose run app rails db:create`
- `docker-compose run app rails db:reset`
- `docker-compose up`

Then visit http://dockerhost:3000/posts, where `dockerhost` points to your
`docker-machine ip`

### Scaffolded files

These commands were run to scaffold some views (no need to re-run, just FYI)

- `docker-compose run app rails g bootstrap:layout`
- `docker-compose run app rails g bootstrap:install static`
- `docker-compose run app rails g simple_form:install --bootstrap`
- `docker-compose run app rails generate kaminari:views bootstrap3`
