FROM docker.io/library/ruby:3.2.2@sha256:1e79a3869fd6b16c98e67008249ea907864747b8c10a274891e99e2e2ca8f807 AS ruby
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
COPY --chown=user:user default.scss default.scss
COPY --chown=user:user favicon.ico favicon.ico
COPY --chown=user:user index.md index.md
RUN bundle exec jekyll build

FROM bundle AS rubocop
COPY --chown=user:user .rubocop.yml .rubocop.yml
RUN bundle exec rubocop

FROM ruby
COPY --from=jekyll /app .
COPY --from=rubocop /app .
CMD ["bundle", "exec", "jekyll", "serve", "--skip-initial-build", "--host", "0.0.0.0", "--port", "8080"]
EXPOSE 8080
