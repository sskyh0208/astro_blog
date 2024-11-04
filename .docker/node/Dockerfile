FROM node:20-alpine AS base

RUN apk add --no-cache bash curl gzip tar vim

ENV PORT=4321
EXPOSE 4321

COPY ./src/blog /app
WORKDIR /app
