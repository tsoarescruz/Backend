## This Project is a Rest API Backend

## App

For start a project, follow the Django documentation in this domain:

https://docs.djangoproject.com/en/3.0/intro/tutorial01/

Command:

```
django-admin startproject BackendMundoGlobo
```

How to create a virtualenv

1 - install virtualenv and run 

```
pip install virtualenvwrapper
```
2 - Create and activate virtualenv RUN:

```
 /bin/bash -l -c "export WORKON_HOME=$HOME/.virtualenvs && export PROJECT_HOME=$HOME/Devel && source /usr/local/bin/virtualenvwrapper.sh && mkvirtualenv backendmundoglobo && workon backendmundoglobo"
```

## Docker

* For build and run the docker environment

```python
docker-compose up --build
```

## Portainer

This service is to monitoring Docker container


How to access:

```
http://localhost:3002/
```


## NetData


This service is to monitoring Environment data and application data.


How to access:

```
http://localhost:19999/
```