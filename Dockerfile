FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

# cache gems
ENV BUNDLE_PATH=/bundle

ADD . $APP_HOME
