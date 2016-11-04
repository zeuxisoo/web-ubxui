usage:
	@echo "make install"
	@echo "make server"
	@echo "make postgres-start"
	@echo "make postgres-stop"
	@echo "make migrate"

install:
	@mix ecto.create

server:
	@mix phoenix.server

postgres-start:
	@pg_ctl -D /usr/local/var/postgres restart

postgres-stop:
	@pg_ctl -D /usr/local/var/postgres stop

migrate:
	@mix ecto.migrate
