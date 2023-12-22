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
