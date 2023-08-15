#build front
FROM node:14.17.3 as builder
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install && NODE_ENV=production VUE_APP_API_URL=http://momo-backend:8081 npm run serve && ls -la /usr/src/app

#release front
FROM nginx:1.21.6-alpine
WORKDIR /app
COPY --from=builder /usr/src/app/dist/* /usr/share/nginx/html/
EXPOSE 8080
