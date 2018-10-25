FROM google/cloud-sdk:alpine

RUN apk update && apk add inotify-tools

COPY ./start.sh /start.sh
COPY ./one-off.sh /one-off.sh

CMD ["/start.sh"]
