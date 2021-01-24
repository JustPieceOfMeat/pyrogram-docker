FROM python:alpine

RUN mkdir /sessions /plugins

VOLUME /sessions

WORKDIR /

COPY . .

CMD ["sh", "start.sh"]