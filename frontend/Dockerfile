FROM node:14.17.3 as builder
WORKDIR /usr/src/app
COPY package*.json ./
COPY nginx.tmpl ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginxproxy/nginx-proxy
COPY --from=builder /usr/src/app/nginx.tmpl /app/
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
EXPOSE 80