# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /usr/app

# Switch to root user for package installation
USER root

# Install supervisord
RUN apt-get update && apt-get install -y supervisor

# Copy the current directory contents into the container at /usr/app
COPY . /usr/app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 80 to the outside world
EXPOSE 80

# Switch to a non-root user if needed for security
# USER nobody

# Run supervisord
CMD ["supervisord", "-c", "/usr/app/supervisord.conf"]
