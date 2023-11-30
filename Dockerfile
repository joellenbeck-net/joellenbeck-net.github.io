FROM docker.io/library/ruby:3.2.2@sha256:db6b1e15eabeae7672ba3844471a0f1cb4eb6f6f5438fe5b8e8696a2a4376708 AS ruby
WORKDIR /home/app
CMD ruby --version

FROM ruby AS common
COPY .bundle/config .bundle/config
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install
COPY lib lib

FROM common AS test
COPY test test

FROM test AS rubocop
COPY .rubocop.yml .rubocop.yml
RUN bundle exec rubocop

FROM test AS tldr
RUN bundle exec tldr

FROM busybox AS prod
RUN --mount=from=rubocop,source=/home/app,target=/mnt/rubocop true
RUN --mount=from=tldr,source=/home/app,target=/mnt/tldr true

