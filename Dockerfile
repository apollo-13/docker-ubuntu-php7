FROM apollo13/nginx
MAINTAINER Bohdan Kolecek <kolecek@apollo13.cz>

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu trusty main" > /etc/apt/sources.list.d/ondrej-php-trusty.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    apt-get update && \
    apt-get -y install \
        php-imagick php-msgpack php-redis \
        php7.0-bcmath php7.0-cli php7.0-pgsql php7.0-gd php7.0-curl php7.0-mbstring php7.0-sqlite3 php7.0-xml php7.0-zip && \

# Clean up

    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

# Install Composer

    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

