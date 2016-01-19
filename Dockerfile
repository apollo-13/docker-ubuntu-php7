FROM apollo13/nginx
MAINTAINER Bohdan Kolecek <kolecek@apollo13.cz>

RUN echo "deb http://ppa.launchpad.net/ondrej/php-7.0/ubuntu trusty main" > /etc/apt/sources.list.d/ondrej-php-7_0-trusty.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    apt-get update && \
    apt-get -y install php7.0-cli php7.0-pgsql php7.0-gd php7.0-curl php7.0-sqlite3 php7.0-dev && \

# Install MsgPack extension

    cd /tmp && \
    git clone --branch php7 https://github.com/msgpack/msgpack-php && \
    cd msgpack-php && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    echo "extension=msgpack.so" > /etc/php/mods-available/msgpack.ini && \
    ln -s /etc/php/mods-available/msgpack.ini /etc/php/7.0/cli/conf.d/20-msgpack.ini && \

# Install REDIS extension

    cd /tmp && \
    git clone --branch php7 https://github.com/phpredis/phpredis && \
    cd phpredis && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    echo "extension=redis.so" > /etc/php/mods-available/redis.ini && \
    ln -s /etc/php/mods-available/redis.ini /etc/php/7.0/cli/conf.d/20-redis.ini && \

# Clean up

    apt-get remove -y --auto-remove --purge php7.0-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

# Install Composer

    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
