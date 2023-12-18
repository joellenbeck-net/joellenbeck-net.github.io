FROM docker.io/library/ruby:3.2.2@sha256:db6b1e15eabeae7672ba3844471a0f1cb4eb6f6f5438fe5b8e8696a2a4376708 AS ruby

FROM ruby AS bundle
ENTRYPOINT []
CMD []
RUN gem update bundler
RUN adduser user
USER user
WORKDIR /app
RUN mkdir tmp
COPY --chown=user:user Gemfile Gemfile
COPY --chown=user:user Gemfile.lock Gemfile.lock
RUN bundle config --global path /home/user/.bundle
RUN bundle install
COPY --chown=user:user . .

FROM bundle AS jekyll
RUN bundle exec jekyll build

FROM bundle AS rubocop
RUN bundle exec rubocop

FROM bundle AS tldr
RUN bundle exec tldr

FROM bundle AS build
COPY --from=jekyll /app/tmp tmp
COPY --from=rubocop /app/tmp tmp
COPY --from=tldr /app/tmp tmp

FROM build AS server
ENTRYPOINT ["bundle", "exec", "jekyll"]
CMD ["serve", "--skip-initial-build",\
  "--host", "0.0.0.0", "--port", "4000"]
EXPOSE 4000

FROM build AS shell
CMD ["bash"]

FROM shell
