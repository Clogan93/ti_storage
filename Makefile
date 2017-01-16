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

reset:
	docker-compose run app bundle exec rake db:migrate:reset

heroku_reset:
	heroku pg:reset DATABASE_URL --app desolate-fortress-66664 --confirm desolate-fortress-66664
	heroku run rake db:migrate --app desolate-fortress-66664

routes:
	docker-compose run app bundle exec rake routes

ci: lint rspec

run:
	docker-compose up

console:
	docker-compose run app bundle exec rails console

clear-cache:
	docker-compose run app bundle exec rails tmp:cache:clear

worker:
	docker-compose run app bundle exec sidekiq -c 5 -v -q default -q mailers

sitemap:
	docker-compose run app bundle exec rails sitemap:refresh

log:
	docker-compose run app bundle exec rails log:clear
