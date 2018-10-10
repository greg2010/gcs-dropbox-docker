FROM google/cloud-sdk:alpine

RUN apk update && apk add inotify-tools

COPY ./start.sh /start.sh

CMD ["/start.sh"]
