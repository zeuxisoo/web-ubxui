# Ubxui

Small web application to demo how to using the phoenix framework

## Development

Install dependency

	mix deps.get
	
Start Database
	
	make postgres-stop
	make postgres-start

Create database and schema

	make install
	make refresh-db
	
Create seeds
	
	make seeds

Develop server

	make server
	
Develop assets

	make dev-assets
	
Migrate

	make migrate

## PostgreSQL

This documentation is tested on version `9.5.4_1`

Run the following command to install (default user is current user)

    $ brew install postgresql
    $ pg_ctl -D /usr/local/var/postgres start
    $ psql -d postgres

If you want to create new user and set password

    $ /usr/local/Cellar/postgresql/<version>/bin/createuser -s postgres
    $ psql -Upostgres postgres

    postgres=# \password postgres
    Enter new password:
    Enter it again:
    postgres=# \q

    $ pg_ctl -D /usr/local/var/postgres restart

If you want the user password must enter

    $ vim /usr/local/var/postgres/pg_hba.conf

    local       all         all                             md5
    host        all         all         127.0.0.1/32        md5
    host        all         all         ::1/128             md5

    $ pg_ctl -D /usr/local/var/postgres restart
