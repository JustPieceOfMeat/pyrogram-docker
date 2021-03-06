FROM python:slim

WORKDIR /
RUN mkdir sessions plugins
VOLUME sessions

COPY . .

CMD ["bash", "start.sh"]