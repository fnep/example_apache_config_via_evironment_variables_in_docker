FROM ubuntu:22.04

# Install Apache
RUN apt-get update \
 && apt-get install -y \
            apache2 \
 && apt-get clean

# Add the apache VirtualHost, to setup the WSGI module for the app
COPY apache-vhost.conf /etc/apache2/sites-enabled/000-default.conf

# Optional: Redirect error log to stdout, to make it visible in `docker compose up` output
RUN ln -sf /dev/stdout /var/log/apache2/error.log

# Add the FastAPI application
RUN mkdir /app
COPY index.html /app/index.html
RUN chown -R www-data:www-data /app

# Expose the DOCUMENT_ROOT envorinmanet vraible to the apache config,
# and set the default value to /var/www/html
RUN  echo "export DOCUMENT_ROOT=\${DOCUMENT_ROOT:=/var/www/html}" >> /etc/apache2/envvars

# Run apache
CMD ["apachectl", "-D", "FOREGROUND"]
