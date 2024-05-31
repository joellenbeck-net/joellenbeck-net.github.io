FROM docker.io/library/ruby:3.3.2@sha256:a67dcbc840ad773775c250f0caef2554a0c6f487289c6b113e1fa4aa1e175887 AS ruby
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
