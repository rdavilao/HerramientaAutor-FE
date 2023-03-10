FROM node:14.15.5-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build --prod

FROM nginx:alpine

COPY --from=build-step /app/dist/   /usr/share/nginx/html