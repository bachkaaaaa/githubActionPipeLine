## Stage 1: Build the Angular application
#FROM node:18-alpine AS build
#
#WORKDIR /usr/src/app
#
## Copy package.json and package-lock.json separately to leverage Docker cache
#COPY package*.json ./
#
## Install project dependencies
#RUN npm install
#
## Copy the rest of the application files
#COPY . .
#
## Build the Angular application in production mode
#RUN npm run build --prod
#
## Stage 2: Serve the Angular app with Nginx
#FROM nginx:alpine
#
## Copy the built Angular app from the previous stage
#COPY --from=build /usr/src/app/dist/project-one /usr/share/nginx/html
#
## Expose port 80 (default port for Nginx)
#EXPOSE 80
#
## Start Nginx server
#CMD ["nginx", "-g", "daemon off;"]



FROM node:18-alpine AS build

WORKDIR /usr/src/app

# Copy package.json and package-lock.json separately to leverage Docker cache
COPY package*.json ./
## Install Angular CLI and project dependencies
 #RUN npm ci

 #RUN npm install -g @angular/cli
# Copy the rest of the applic ation files
COPY . .
#run the build
RUN npm run build --prod


FROM nginx:alpine
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf
COPY --from=build /usr/src/app/dist/project-one/browser /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
