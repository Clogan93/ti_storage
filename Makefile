build:
	docker-compose build

bundle:
	docker-compose run app bundle install

lint:
	docker-compose run app bundle exec rubocop

rspec:
	docker-compose run app bundle exec rspec

run:
	docker-compose up

console:
	docker-compose run app bundle exec rails console
