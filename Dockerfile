FROM ruby:3.0.4-alpine

ARG RAILS_ROOT=/my_own_blog
ARG PACKAGES="postgresql-dev build-base tzdata gcompat yarn"
ARG PORT=5000
ARG BUNDLER_VERSION="2.3.9"

RUN apk update \
 && apk upgrade \
 && apk add --update --no-cache $PACKAGES

RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

RUN gem install bundler:$BUNDLER_VERSION
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install --jobs 5
RUN yarn install --check-files

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE $PORT
CMD bundle exec rails s -p $PORT
