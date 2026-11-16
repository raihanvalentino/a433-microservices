FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

ARG VUE_APP_BACKEND
ENV VUE_APP_BACKEND=$VUE_APP_BACKEND

ENV NODE_OPTIONS="--openssl-legacy-provider"

RUN npm run build

FROM nginx:1.27-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80