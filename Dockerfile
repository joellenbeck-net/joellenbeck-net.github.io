FROM docker.io/library/ruby:3.3.0@sha256:30ff8d6bd91710608014613c9b1820ced34f54af90d4ea20feb67cb2cc1e703b AS ruby

FROM ruby
ENTRYPOINT []
CMD ["true"]
WORKDIR /app
ENV HOME=/app
ENV BUNDLE_APP_CONFIG=.bundle
