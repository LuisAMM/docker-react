#step 1
FROM node:alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# the path to the build folder is /app/build

#the FROM statement mark the end and start of a block
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html