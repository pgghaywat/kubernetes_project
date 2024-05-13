FROM centos:7
LABEL maintainer="shikhardevops@gmail.com"

# Install dependencies
RUN yum install -y \
    httpd \
    zip \
    unzip \
 && yum clean all

# Download and unzip the file
RUN curl -L https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip -o /tmp/photogenic.zip \
 && unzip /tmp/photogenic.zip -d /var/www/html/ \
 && rm /tmp/photogenic.zip

# Set working directory
WORKDIR /var/www/html/

# Start Apache
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80
EXPOSE 80
