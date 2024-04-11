FROM docker.io/library/ruby:3.3.0@sha256:8287226914c6b4041364196f4688ea0c5804cf7b61035b34be2a7c20b5c74501 AS ruby
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
