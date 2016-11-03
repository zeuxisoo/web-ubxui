# Ubxui

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

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
