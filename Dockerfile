# build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npx parcel build src/index.html --out-dir dist --public-url ./

# production stage
FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
# optional: expose port 80
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
