FROM node:14-alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

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