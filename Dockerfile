FROM ruby:2.3-slim

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs

ENV APP_HOME /myapp

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

ADD . $APP_HOME
