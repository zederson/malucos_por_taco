FROM ruby:2.4.1
MAINTAINER Ederson de Lima <edersondelima@gmail.com>

ENV APP_DIR=/var/www/malucos_por_taco

ENV NODE_VERSION 7
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends nodejs locales

ENV PHANTOMJS_VERSION 2.1.1
RUN curl -L -O https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2
RUN tar -jxvf phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs
RUN mv phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin/phantomjs /usr/local/bin/
RUN rm phantomjs-$PHANTOMJS_VERSION-linux-x86_64.tar.bz2 && rm -rf phantomjs-$PHANTOMJS_VERSION-linux-x86_64/bin
RUN chmod 755 /usr/local/bin/phantomjs

RUN mkdir -p $APP_DIR

ENV RAILS_ENV production
ENV SECRET_KEY_BASE 431cf493b2d9009e52377aeb2c4db7361b37792d0be26259072e9705beca7ebad310172f3ad370f223d1d18a23382e9098ab21bded65c21f9de9b1329bec5d5f

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
RUN gem install bundler-audit

WORKDIR $APP_DIR
ADD . $APP_DIR

RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Brazil/East /etc/localtime

# RUN chown -R nobody:nogroup $APP_DIR
# USER nobody

EXPOSE 3000

CMD [ "/var/www/malucos_por_taco/docker/start.sh" ]
