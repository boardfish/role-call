FROM ruby:2.5.1-alpine
RUN apk add --update \
  build-base \
  mariadb-dev \
  postgresql-dev \
  nodejs \
  tzdata \
  && rm -rf /var/cache/apk*
RUN gem install bundler
WORKDIR /myapp
COPY Gemfile* /myapp/
RUN bundle install
WORKDIR /myapp
COPY . /myapp/
RUN chmod +x /myapp/entrypoint.sh
CMD /bin/sh -c "rm -f /myapp/tmp/pids/server.pid && ./bin/rails server"
