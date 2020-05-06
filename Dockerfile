# builder phase build the app and creates the files.
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# nginx container automatically starts nginx
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html