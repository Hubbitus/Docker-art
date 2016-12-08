# Docker-art
Package in docker [art.sf.net](http://art.sourceforge.net/)

To fast start just run it like:

    docker run -d --name art_app -p 8080:8080 hubbitus/docker-art

Then you may reach it at: http://localhost:8080/

> **Warning** You may use it with [embedded database](https://sourceforge.net/p/art/wiki/Installing/#using-the-default-database) but please be aware what it will be lost on container delete (f.e. on upgrade)!

## Use persistent database
If you wish not only try or experiment with it recommended to setup some persistent database. For example with postgres you may do something like:

    docker network create art_net
    docker run -d --name art_db --restart always --net=art_net \
        -v $(pwd)/postgres.data:/var/lib/postgresql/data \
        -e POSTGRES_USER=art \
        -e POSTGRES_PASSWORD=secret \
            postgres:latest
    docker run -d --net art_net --name art_app -p 8080:8080 hubbitus/docker-art

Then in setup wizard provide DB host `art_db` (name of db container) login and password from command above.

## New builds on docker hub

Automated build you may find on docker hub: https://hub.docker.com/r/hubbitus/docker-art/

