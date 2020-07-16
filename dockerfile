FROM phusion/baseimage

#Install system libs necessaries

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y \
                vim \
                git \
                build-essential \
                gcc \
                libpq-dev \
                libmysqlclient-dev \
                libssl-dev \
                mysql-client libmysqlclient-dev \
                postgresql-client libpq-dev \
                python-dev python-pip \
                zlib1g-dev \
                lib32z1-dev libxslt-dev \
                libxml2-dev \
                ca-certificates \
                curl \
                tzdata\
    			libssl-dev \
    			apt-utils \
    			openssh-server \ 
    			openssh-client && \
                apt-get autoremove -y && \
                rm -rf /var/lib/apt/lists/* 

#Activate Python
FROM python:3.7-slim

#Upgrade Pip
RUN python3 -m pip install --upgrade pip

WORKDIR ./usr/src/app/

#Copy and Install Requirements
COPY requirements.txt .

RUN python3 -m pip install --no-cache-dir -r requirements.txt

#Insert app to /usr/src/app/
ADD . .

# Create user and group
RUN groupadd --gid 9999 app && \
    useradd --uid 9999 --gid app app  && \
    chown -R app:app /usr/src/app/

USER app

#Expose app port
EXPOSE 80 443 8000

CMD /bin/bash