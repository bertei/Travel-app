FROM --platform=linux/amd64 ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
    
COPY . /var/www/html

WORKDIR /var/www/html

RUN apt-get update -y \
    && apt-get install -y apache2 php libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl vim \
    && service apache2 start \
    && sed -i 's/index.html/index.php /g' /etc/apache2/mods-enabled/dir.conf \
    && sed -i 's/localhost/travel-app-mysql.coh32k3gawkn.us-east-1.rds.amazonaws.com/g' /var/www/html/config.php \
    && sed -i 's/""/"codepass"/g' /var/www/html/config.php

#CMD ["php", "-S", "0.0.0.0:80"]
CMD ["apachectl", "-D", "FOREGROUND"]