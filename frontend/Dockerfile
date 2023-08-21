FROM node:16-alpine as builder

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:stable-alpine
ARG VERSION=${VERSION}
LABEL name="momo-frontend" \
      version=${VERSION}
WORKDIR /usr/src/app
ENV NODE_ENV=production
COPY --from=builder /usr/src/app/dist ./static/momo-store
COPY app.conf /etc/nginx/conf.d/app.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]