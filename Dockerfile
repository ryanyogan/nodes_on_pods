# ---- ENV CONFIG ----
ARG APP=APP
ARG PORT=8080
ARG MIX_ENV=prod
ARG PROJECT=app_template

# ---- COMPILE ----
FROM elixir:1.11-alpine as builder

LABEL maintainer="ryanyogan@gmail.com"

ARG MIX_ENV
ARG APP
ARG PROJECT

ENV LANG C.UTF-8

WORKDIR /$APP

COPY mix.* ./
COPY config ./config
COPY apps/api/mix.exs ./apps/api/
COPY apps/domain/mix.exs ./apps/domain/

# Install hex, rebar3, and mix deps
RUN mix do \
  local.hex --force, \
  local.rebar --force, \
  deps.get --only $MIX_ENV, \
  deps.compile

# Copy the applications code
COPY apps ./apps

# Build the applications
RUN MIX_ENV=$MIX_ENV mix do compile, release

# ---- PACKAGE BUILD ----
FROM alpine:3.11

ARG MIX_ENV
ARG APP
ARG PORT

RUN apk add --no-cache ncurses-libs && rm -rf /var/cache/apk/*

USER nobody

WORKDIR /$APP

COPY --from=builder --chown=nobody:nobody /$APP/_build/$MIX_ENV/rel/$PROJECT .

EXPOSE $PORT

ENTRYPOINT [ "app_template/bin/app_template" ]
