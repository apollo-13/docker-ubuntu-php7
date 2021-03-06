FROM apollo13/nginx:16.04
MAINTAINER Bohdan Kolecek <kolecek@apollo13.cz>

# Set UTF-8 localeg for iconv()
ENV LC_CTYPE C.UTF-8

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php-xenial.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    apt-get update && \
    apt-get -y install \
        php-imagick php-msgpack php-redis \
        php7.0-bcmath php7.0-cli php7.0-pgsql php7.0-gd php7.0-curl php7.0-mbstring php7.0-sqlite3 php7.0-xml php7.0-zip && \

# Clean up

    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

# Install Composer

    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \

# Register open-source forks with major bug fixes

    composer config -g repositories.events vcs git@github.com:bohdankolecek/Events.git && \
    composer config -g repositories.console vcs git@github.com:bohdankolecek/console.git
