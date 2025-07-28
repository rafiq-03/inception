# Start with the official Debian base image
FROM debian:bullseye-slim

# Explanation:
# We're using the slim version of Debian Bullseye (version 11) as our base image
# The slim version is smaller in size, containing only essential packages

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    MYSQL_ROOT_PASSWORD=my-secret-pw \
    MYSQL_DATABASE=myapp \
    MYSQL_USER=myuser \
    MYSQL_PASSWORD=mypassword

# Explanation:
# DEBIAN_FRONTEND=noninteractive prevents interactive prompts during package installation
# The other variables configure our MariaDB instance with default values

# Update package lists and install MariaDB server
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -rf /var/lib/apt/lists/*

# Explanation:
# apt-get update refreshes the package list
# apt-get install -y mariadb-server installs MariaDB (the -y flag automatically answers yes to prompts)
# rm -rf /var/lib/apt/lists/* cleans up the package lists to reduce image size

# Configure MariaDB
RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

# Explanation:
# Creates and sets permissions for the MySQL runtime directory
# This is needed for the MySQL daemon to run properly

# Copy initialization script
# COPY init.sql /docker-entrypoint-initdb.d/
WORKDIR /app
COPY ./setup.sh ./setup.sh
# Explanation:
# This copies an SQL file that will be executed when the container first starts
# This is where you'd put database initialization commands

# Expose MySQL port
EXPOSE 3306

# Explanation:
# This tells Docker that the container listens on port 3306 (MySQL's default port)
# Note: This doesn't actually publish the port - that's done with -p when running the container

# Set the entrypoint
# ENTRYPOINT ["/usr/bin/mysqld_safe"]

CMD "./setup"

# Explanation:
# This specifies the command to run when the container starts
# mysqld_safe is the recommended way to start the MySQL/MariaDB server