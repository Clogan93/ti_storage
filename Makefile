build:
	docker-compose build

bundle:
	docker-compose run app bundle install

lint:
	docker-compose run app bundle exec rubocop

rspec:
	docker-compose run app bundle exec rspec

setup: bundle
	docker-compose run app bundle exec rails db:create
	make migrate

migrate:
	docker-compose run app bundle exec rails db:migrate

seed:
	docker-compose run app bundle exec rails db:seed

sync:
	docker-compose run app bundle exec rails centershift:sites:sync
	docker-compose run app bundle exec rails centershift:units:sync

reset:
	docker-compose run app bundle exec rake db:migrate:reset
	make seed
	make sync

heroku_reset:
	heroku pg:reset DATABASE_URL --app desolate-fortress-66664-pr-247 --confirm desolate-fortress-66664-pr-247
	heroku run rake db:migrate --app desolate-fortress-66664-pr-247
	heroku run rake db:seed --app desolate-fortress-66664-pr-247
	heroku run bundle exec rails centershift:units:sync --app desolate-fortress-66664-pr-247
	heroku run bundle exec rails centershift:units:sync --app desolate-fortress-66664-pr-247

routes:
	docker-compose run app bundle exec rake routes

ci: lint rspec

run:
	docker-compose up

console:
	docker-compose run app bundle exec rails console
