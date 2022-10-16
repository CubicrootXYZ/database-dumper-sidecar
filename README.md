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