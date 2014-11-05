Docker containers to run Symfony2 applications.

## Services

* Nginx
* PHP 5.6
* MySQL
* RabbitMQ (not yet available)
* ElasticSearch (not yet available)

## Usage

```
$ docker run --name data hellslicer/symfony2-full:data

$ docker run --volumes-from data --name mysql hellslicer/symfony2-full:mysql

$ docker run -v $(pwd):/srv --name php hellslicer/symfony2-full:php

$ docker run -d -p 80:80 \
    -v $(pwd):/srv \
    -link	php:php	\
    -link	mysql:mysql	\
    -e INIT=bin/reload \
    hellslicer/symfony2-full:latest
```

## Parameters

Configuration is done through environment variables that you can change with `docker run`' s `-e` switch:

* `DB_NAME`, the database name. Defaults to `symfony`.
* `INIT`, path to a initialization script (eg: creating db tables, etc). Ignored if empty.