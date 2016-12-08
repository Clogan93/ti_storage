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

reset:
	docker-compose run app bundle exec rake db:migrate:reset
	docker-compose run app bundle exec rails db:seed

routes:
	docker-compose run app bundle exec rake routes

heroku_reset:
	heroku pg:reset DATABASE_URL --app desolate-fortress-66664 --confirm desolate-fortress-66664
	heroku run rake db:migrate --app desolate-fortress-66664
	heroku run rake db:seed --app desolate-fortress-66664

ci: lint rspec

run:
	docker-compose up

console:
	docker-compose run app bundle exec rails console
