FROM ruby:2.2.0
MAINTAINER Sebastian Schneider <mail@sesc.eu>

RUN gem install fluentd -v "~>0.12.3"
RUN mkdir /etc/fluent
RUN apt-get update \
    && apt-get install -y libcurl4-gnutls-dev make \
    && rm -rf /var/lib/apt/lists/*

RUN /usr/local/bin/gem install fluent-plugin-elasticsearch

ADD fluent.conf /etc/fluent/

ENTRYPOINT ["/usr/local/bundle/bin/fluentd", "-c", "/etc/fluent/fluent.conf"]

