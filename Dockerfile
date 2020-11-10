FROM python:latest

RUN mkdir /sessions /plugins

VOLUME /sessions

COPY main.py config.ini start.sh /

WORKDIR /

RUN pip install pyrogram tgcrypto

RUN chmod +x /start.sh

CMD /start.sh