FROM alpine

COPY cachet /usr/bin/cachet
RUN ln -s cachet /usr/bin/cachet-init \
 && ln -s cachet /usr/bin/cachet-crontab \
 && ln -s cachet /usr/bin/cachet-config-test \
 && ln -s cachet /usr/bin/cachet-post-metric \
 && ln -s cachet /usr/bin/cachet-update-component \
 && ln -s cachet /usr/bin/cachet-post-component-incident

RUN apk add --no-cache curl jq

COPY config/ /etc/cachet-client.d/
CMD cachet-crontab /etc/cachet-client.d | crontab - && crond -f -d 0
