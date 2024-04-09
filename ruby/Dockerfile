FROM docker.io/library/ruby:3.3.0@sha256:1cf0b812143b1ec4308f7d441f7d134afd394bc6da661179d38979cee54314cd AS ruby
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
