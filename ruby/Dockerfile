FROM docker.io/library/ruby:3.3.1@sha256:f45a7783ead99e3d9de42c1d8bf744159be66d11e424883a5efb57637bfbcfd0 AS ruby
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
