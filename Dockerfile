FROM ruby:3.1.1-alpine AS dev
RUN apk add build-base git bash
WORKDIR /app
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

FROM dev AS production
COPY Gemfile Gemfile.lock ./
RUN bundle install --deployment --without test development
COPY . ./
CMD ./bot
