FROM docker.io/library/ruby:3.2.2@sha256:db6b1e15eabeae7672ba3844471a0f1cb4eb6f6f5438fe5b8e8696a2a4376708 AS ruby
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
