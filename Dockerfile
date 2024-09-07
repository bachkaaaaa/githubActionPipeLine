# Stage 1: Build the Angular application
FROM node:17-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the Angular application
RUN npm run build --prod

# Stage 2: Serve the application using NGINX
FROM nginx:alpine

# Copy the built Angular app from the previous stage
COPY --from=build /app/dist/project-one /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
