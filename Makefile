usage:
	@echo "make install"
	@echo "make postgres-start"
	@echo "make postgres-stop"
	@echo "make server"
	@echo "make dev-assets"
	@echo "make migrate"
	@echo "make seeds"
	@echo "make refresh-db"

install:
	@mix ecto.create

postgres-start:
	@pg_ctl -D /usr/local/var/postgres restart

postgres-stop:
	@pg_ctl -D /usr/local/var/postgres stop

server:
	@mix phoenix.server

dev-assets:
	@npm run dev

migrate:
	@mix ecto.migrate

seeds:
	@mix run priv/repo/seeds.exs

refresh-db:
	@mix ecto.rollback --all
	@mix ecto.migrate --all
	@mix run priv/repo/seeds.exs
