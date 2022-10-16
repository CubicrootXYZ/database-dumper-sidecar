# Database dumper sidecar

A docker container for backing up your SQL databases. 

## Settings

The container is configured via environment variables:

* DB_HOST: host name to connect to
* DB_PASSWORD: password for the database
* DB_USER: username for the database
* DB_PORT: port the database is running on
* SLEEP_SECONDS: delay between backups

## Installation

1. Mount a directory to `/backup`
2. Set the environment variables from above
3. Run it

### Docker compose example
```
version: '3.2'

services:
  db:
    image: mysql:latest
    volumes:
      - "/data/db-data:/var/lib/mysql"
    environment:
      - 'MYSQL_ROOT_PASSWORD=password'
      - 'MYSQL_DATABASE=my-app'
    networks:
      - my-app
    command:
      - --default-authentication-plugin=mysql_native_password

  db-backup:
    image: cubicrootxyz/database-dumper-sidecar:latest
    volumes:
      - "/data/db-backup:/backup"
    environment:
      - 'DB_HOST=db'
      - 'DB_PASSWORD=password'
      - 'DB_USER=root'
      - 'DB_PORT=3306'
      - 'SLEEP_SECONDS=7200'
    networks:
      - my-app
```