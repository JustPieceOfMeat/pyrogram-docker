FROM python:alpine

RUN mkdir /sessions /plugins

VOLUME /sessions

WORKDIR /

COPY . .

CMD ["bash", "start.sh"]