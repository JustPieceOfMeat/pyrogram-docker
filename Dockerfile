FROM python:latest

RUN mkdir /sessions /plugins

VOLUME /sessions

COPY main.py config.ini start.sh /

WORKDIR /

RUN pip install https://github.com/pyrogram/pyrogram/archive/master.zip tgcrypto

RUN chmod +x /start.sh

CMD /start.sh