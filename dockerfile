FROM phusion/baseimage

#Install system libs necessaries
RUN apt-get update -qq && apt-get install vim git -qq

#Activate Python
FROM python:3.7-slim

#Upgrade Pip
RUN python3 -m pip install --upgrade pip

#install virtualenv
RUN pip install virtualenvwrapper

#Create and activate virtualenv
RUN /bin/bash -l -c "export WORKON_HOME=$HOME/.virtualenvs && export PROJECT_HOME=$HOME/Devel && source /usr/local/bin/virtualenvwrapper.sh && mkvirtualenv backendmundoglobo && workon backendmundoglobo"

#RUN python3 -m pip install Django

#Copy and Install Requiremts

COPY requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt

#Activate web dir
WORKDIR web 

#Start django-admin project
RUN django-admin startproject app

#ADD . ./app

#Expose local port 
EXPOSE 8000


#RUN /bin/bash -l -c "export WORKON_HOME=$HOME/.virtualenvs "
#RUN /bin/bash -l -c "export PROJECT_HOME=$HOME/Devel"
#RUN /bin/bash -l -c "source /usr/local/bin/virtualenvwrapper.sh"
#RUN /bin/bash -l -c "mkvirtualenv backendmundoglobo"
#RUN /bin/bash -l -c "workon backendmundoglobo"
