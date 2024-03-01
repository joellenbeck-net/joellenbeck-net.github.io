FROM docker.io/library/ruby:3.3.0@sha256:317ac9112cd3766346c8de3e58220231574e56689b6244cdc88daff2076d7190 AS ruby
ENTRYPOINT []
CMD ["true"]
ENV BUNDLE_APP_CONFIG=.bundle
WORKDIR /app

FROM ruby AS bundle
COPY Gemfile* .
RUN bundle config --local path .bundle
RUN bundle install
COPY . .

FROM bundle AS rubocop
RUN bundle exec rubocop

FROM bundle AS tldr
RUN bundle exec tldr

FROM bundle
RUN \
  --mount=from=rubocop,target=/mnt/rubocop \
  --mount=from=tldr,target=/mnt/tldr \
  true
