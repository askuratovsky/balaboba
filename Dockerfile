FROM ruby:3.0

WORKDIR /app
COPY . .
RUN bundle install
