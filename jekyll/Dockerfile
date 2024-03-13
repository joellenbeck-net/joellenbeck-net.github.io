FROM docker.io/library/ruby:3.3.0@sha256:a5492b85abcb6fefe3f243e8a2019536fe7186cc87c19a89e8a9bd49d394b040 AS ruby
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
