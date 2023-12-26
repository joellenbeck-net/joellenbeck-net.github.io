FROM docker.io/library/ruby:3.3.0@sha256:8e811f2174f16f77792dcfb6757cc27820caf21d19e2debd759138b2e77cb702 AS ruby
ENTRYPOINT []
CMD []
RUN adduser --comment '' --disabled-password user
USER user
WORKDIR /app
ENV BUNDLE_APP_CONFIG=.bundle
RUN bundle config set path .bundle

FROM ruby AS bundle
COPY --chown=user:user Gemfile Gemfile
COPY --chown=user:user Gemfile.lock Gemfile.lock
RUN bundle install
COPY --chown=user:user lib lib
COPY --chown=user:user test test

FROM bundle AS rubocop
COPY --chown=user:user .rubocop.yml .rubocop.yml
RUN bundle exec rubocop

FROM bundle AS tldr
COPY --chown=user:user .tldr.yml .tldr.yml
RUN bundle exec tldr

FROM ruby
COPY --from=rubocop /app .
COPY --from=tldr /app .
