FROM phusion/baseimage

#Install system libs necessaries
RUN apt-get update -y && apt-get install -y vim git build-essential \
    libpq-dev libmysqlclient-dev ca-certificates curl tzdata\
    libssl-dev apt-utils nodejs openssh-server openssh-client && \
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

#RUN useradd -u 1000 -m -s /bin/bash app
#RUN chown -R app:app .


# Create user and group
RUN groupadd --gid 9999 app && \
    useradd --uid 9999 --gid app app  && \
    chown -R app:app /usr/src/app/

USER app

#Expose app port
EXPOSE 80 443 8000

CMD /bin/bash