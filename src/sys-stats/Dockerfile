FROM node:16.0.0 as build-stage
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY ./ /app/
RUN chmod a+x node_modules/.bin/react-scripts
RUN npm run build

FROM nginx:1.23.1
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-stage /app/build/ /usr/share/nginx/html