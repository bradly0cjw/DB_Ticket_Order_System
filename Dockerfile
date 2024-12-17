# Use the official Node.js image to build the app
FROM node:16 as build-stage

# Set the working directory
WORKDIR /app

# Clone from the repository
# RUN git clone https://github.com/bradly0cjw/Ticket_Order_System_FE.git \
#     && cp -r Ticket_Order_System_FE/* . \
#     && rm -rf Ticket_Order_System_FE

# # Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Use the official Nginx image to serve the app
FROM nginx:alpine as production-stage

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the built files from the build stage
COPY --from=build-stage /app/dist .

# Copy custom Nginx configuration file
COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80