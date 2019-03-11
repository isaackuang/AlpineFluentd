FROM isaackuang/alpine-base:3.8.0

RUN apk add --no-cache \
        ca-certificates \
        ruby ruby-irb ruby-etc ruby-webrick && \
    apk add --no-cache --virtual .build-deps \
        build-base \
        ruby-dev gnupg && \
    echo 'gem: --no-document' >> /etc/gemrc && \
    gem install oj -v 3.3.10 && \
    gem install json -v 2.1.0 && \
    gem install fluentd -v 1.4.0 && \
    gem install bigdecimal -v 1.3.5 && \
    apk del .build-deps && \
    rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

COPY config /
