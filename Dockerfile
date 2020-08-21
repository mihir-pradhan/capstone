# Use Nginx Alpine image
FROM nginx:alpine

# Copy index.html to the Nginx folder in the container
COPY index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80
