FROM docker.io/library/ruby:3.3.4@sha256:748bb597c009956ae0dfd20ad6378347fa579b0622b7f55a972736cc43f29b23 AS ruby
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
