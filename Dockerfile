# Use the official Apache image as the base image
FROM httpd:2.4

# Set the working directory to the Apache document root
WORKDIR /usr/local/apache2/htdocs

# Copy the index.html file from the current directory into the container
COPY index.html .

# Expose port 80 for web traffic
EXPOSE 80
