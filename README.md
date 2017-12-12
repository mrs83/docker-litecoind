Litecoind for Docker
====================

[![Docker Stars](https://img.shields.io/docker/stars/mscam/docker-litecoind.svg)](https://hub.docker.com/r/mscam/docker-litecoind/)
[![Docker Pulls](https://img.shields.io/docker/pulls/mscam/docker-litecoind.svg)](https://hub.docker.com/r/mscam/docker-litecoind/)

What about a container to ship Litecoin to the moon?

This repository allows you to run a fully working litecoind node by using Docker.


Requirements
------------

* Physical machine, cloud instance, or VPS that supports Docker.
* At least 10+ GB to store the blockchain and litecoind data.

Usage
-----

1. Build the docker container, or in alternative use the pre-built image (will be added soon):

    docker build -t litecoind  .

2. Create a `litecoind-data` volume to store persistent litecoind's blockchain data:

    docker volume create --name=litecoind-data

3. Run litecoind's docker image using the litecoind-data volume:

    docker run -v litecoind-data:/opt/litecoind/data --name=litecoind-node litecoind
