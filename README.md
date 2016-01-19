# Ubuntu with PHP7 #

Base docker image for PHP based applications, extending the apollo13/ubuntu container with:

* PHP7
* MsgPack extension
* Composer

Build of this container is located in private Tutum repository. In order to use private repositories you must provide your login credentials:

    docker login
    docker pull tutum.co/uctenkomat/ubuntu-php7:master

*docker login* needs to be executed just once, as it stores the authentication key in *~/.dockercfg* for future uses.

Alternatively you can build the image on your computer by executing the following command in the root directory
of the repository:

    docker build -t "apollo13/ubuntu-php7" .

## Updating the repository and building the project ##

This container contains script for updating the GIT repository to the latest version, and for performing subsequent
build process (e.g. *composer install* or *npm install*).

Script for updating GIT repository discards all local changes and should not be used if you mount your local repository
into the container instance. In such case you should only perform build.
 
To update the repository (discarding all local changes) by pulling the latest revision followed by building of the project, execute:

    docker exec -t -i CONTAINER_NAME_OR_ID /env.sh update.sh

To build the project (without pulling the latest revision), execute:

    docker exec -t -i CONTAINER_NAME_OR_ID /env.sh build.sh
