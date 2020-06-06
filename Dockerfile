FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build

FROM nginx
# buildした成果物（/app/build）をbuilderフェーズからコンテナにコピーする
COPY --from=builder /app/build /usr/share/nginx/html