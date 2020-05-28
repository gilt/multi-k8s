FROM node:alpine
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build ## this will create a folder inside app directory with all prod assets

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html  #copy over the assets from the builder phase. 'build' is the dir created in builder phase above