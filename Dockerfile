FROM ruby:3.0.0-alpine

ARG RAILS_ROOT=/my_own_blog
ARG PACKAGES="postgresql-dev bash build-base tzdata gcompat yarn"
ARG BUNDLER_VERSION="2.3.9"
ENV BUNDLE_PATH="/bundle_cache"
ENV GEM_HOME="/bundle_cache"
ENV GEM_PATH="/bundle_cache"

RUN apk update \
 && apk upgrade \
 && apk add --update --no-cache $PACKAGES

WORKDIR $RAILS_ROOT

RUN gem install bundler:$BUNDLER_VERSION
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 5

COPY package.json yarn.lock ./
RUN yarn install --check-files

ADD . $RAILS_ROOT
ENV PATH=$RAILS_ROOT/bin:${PATH}

EXPOSE 3000
CMD bin/docker-entrypoint
