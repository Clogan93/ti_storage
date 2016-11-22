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
	docker-compose run app bundle exec rake db:reset

ci: bundle lint rspec

run:
	docker-compose up

console:
	docker-compose run app bundle exec rails console
