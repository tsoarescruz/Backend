.PHONY: all setup run
all: setup run

run:
	./manage.py runserver 0.0.0.0:8000

install:
	pip3 install -r requirements.txt

