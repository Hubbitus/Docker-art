# Docker-art
Package in docker [art.sf.net](http://art.sourceforge.net/)

To fast start just run it like:

    docker run -d --name art_app -p 8080:8080 hubbitus/docker-art

Then you may reach it at: http://localhost:8080/

> **Warning** You may use it with [embedded database](https://sourceforge.net/p/art/wiki/Installing/#using-the-default-database) but please be aware what it will be lost on container delete (f.e. on upgrade)!

## Postgres assumed and DB auto-bootstrap implemented
This image assumed you use it with postgres and entrypoint modified to create required tables for you automatically.

## Use persistent database
If you wish not only try or experiment with it recommended to setup some persistent database. For example with postgres you may do something like:

    docker-compose up -d

Then in setup wizard provide DB host `art_db` (name of db container) login and password from command above.

## New builds on docker hub

Automated build you may find on docker hub: https://hub.docker.com/r/hubbitus/docker-art/

## Upgrading
Now it is possible only in manual way by documentation: https://sourceforge.net/p/art/wiki/Upgrading/

FR to make it possible do it correctly:
 - https://sourceforge.net/p/art/discussion/352129/thread/933f4a4bf7/ -   Auto upgrade DB please
 - https://sourceforge.net/p/art/discussion/352129/thread/8a5f47095a/ -   Please allow configure ART database automatically

In any case all SQL files in container in directory `/database/`
