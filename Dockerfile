FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y build-essential nodejs
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

# Herokuデプロイ用追記
CMD ["rails", "server", "-b", "0.0.0.0"]