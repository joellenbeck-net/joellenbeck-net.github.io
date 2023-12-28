FROM docker.io/library/ruby:3.3.0@sha256:30ff8d6bd91710608014613c9b1820ced34f54af90d4ea20feb67cb2cc1e703b AS ruby
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

FROM bundle AS jekyll
COPY --chown=user:user _config.yml _config.yml
COPY --chown=user:user _layouts _layouts
COPY --chown=user:user favicon.ico favicon.ico
COPY --chown=user:user images images
COPY --chown=user:user index.html index.html
COPY --chown=user:user papers papers
COPY --chown=user:user stylesheets stylesheets
RUN bundle exec jekyll build

FROM bundle AS rubocop
COPY --chown=user:user .rubocop.yml .rubocop.yml
RUN bundle exec rubocop

FROM ruby
COPY --from=jekyll /app .
COPY --from=rubocop /app .
CMD ["bundle", "exec", "jekyll", "serve", "--skip-initial-build", "--host", "0.0.0.0", "--port", "8080"]
EXPOSE 8080
