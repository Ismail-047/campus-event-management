# Use official Nginx image
FROM nginx:stable-alpine

# Copy all your HTML and CSS files into Nginx's default html folder
COPY ./src /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
