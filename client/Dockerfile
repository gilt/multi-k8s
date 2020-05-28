FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
## this will create a folder inside app directory with all prod assets
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
#copy over the assets from the builder phase. 'build' is the dir created in builder phase above
COPY --from=builder /app/build /usr/share/nginx/html