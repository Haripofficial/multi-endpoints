# Use the official Python image as the base image
FROM python:alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN apk update && apk add nginx && apk add supervisor
# Copy the Flask application code into the container
COPY . /app/
# Remove the default Nginx configuration file
RUN rm /etc/nginx/http.d/default.conf

# Copy the custom Nginx configuration file into the container
COPY nginx.conf /etc/nginx/http.d/nginx.conf
# Expose the port on which the Flask app will run
COPY supervisor.conf /etc/supervisor.conf
# Run Supervisor when the container starts
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf"]
