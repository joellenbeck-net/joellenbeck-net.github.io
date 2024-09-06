FROM docker.io/library/ruby:3.3.5@sha256:9ee601015fbb7c610ae02137d5698ab712f821069eaf7c0548e58a5b609970aa AS ruby
ENTRYPOINT []
CMD ["true"]
ENV BUNDLE_APP_CONFIG=.bundle
WORKDIR /app

FROM ruby AS bundle
COPY Gemfile* .
RUN bundle config --local path .bundle
RUN bundle install
COPY . .

FROM bundle AS jekyll
RUN bundle exec jekyll build

FROM bundle AS rubocop
RUN bundle exec rubocop

FROM bundle
RUN \
  --mount=from=jekyll,target=/mnt/jekyll \
  --mount=from=rubocop,target=/mnt/rubocop \
  cp -a /mnt/jekyll/app/public .
