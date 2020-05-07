# builder phase build the app and creates the files.
FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# nginx container automatically starts nginx
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
