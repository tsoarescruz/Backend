.PHONY: all setup run
all: setup run

run:
	./manage.py runserver 0.0.0.0:8000

install:
	pip3 install -r requirements.txt

dockerinstall:
# 	@cp .env-example .env
	@docker-compose build
	@docker-compose up -d
	@sleep 30
	@docker-compose run --rm web pip3 install -r requirements.txt
	@docker-compose run --rm web python manage.py migrate
	@docker-compose stop

dockerbuild:
	@@docker-compose build

dockerup:
	@docker-compose up

dockerstop:
	@docker-compose stop

dockersuperuser:
	@docker-compose run --rm web python manage.py createsuperuser

dockershell:
	@docker-compose run --rm web python manage.py shell_plus

dockerwatch:
	@docker-compose run --rm web gulp watch

dockerassets:
	@docker-compose run --rm web gulp build

dockertest:
	@docker-compose run --rm -e REUSE_DB=1 web coverage run --source=. --omit=*/wsgi.py manage.py test
	@docker-compose run --rm web coverage report
	@docker-compose run --rm web coverage html

dockerclear:
	@rm -fr bower_components/
	@rm -fr node_modules/
	@rm -fr .coverage
	@rm -fr html_cov/

