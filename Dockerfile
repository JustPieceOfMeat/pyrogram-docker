FROM python:latest

RUN mkdir /sessions /plugins

VOLUME /sessions

WORKDIR /

COPY . .

CMD ["bash" "start.sh"]