# Base image
FROM ubuntu:22.04

# Set non-interactive environment for apt
ENV DEBIAN_FRONTEND=noninteractive

# Set up a working directory
WORKDIR /home/dev

# Copy the install.sh script into the container
COPY . /home/dev/

# Make the script executable
RUN chmod +x /home/dev/install.sh


# Run the install.sh script
RUN /home/dev/install.sh

# Copy any scripts or setup files from your local environment (optional)
# ADD ./scripts /usr/local/bin

# Expose any ports you need (optional)
# EXPOSE 8080

# Set default shell
CMD ["/bin/bash"]
