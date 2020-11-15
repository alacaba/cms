FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /cms
WORKDIR /cms
COPY Gemfile /cms/Gemfile
COPY Gemfile.lock /cms/Gemfile.lock
RUN bundle install --binstubs
COPY . /cms
