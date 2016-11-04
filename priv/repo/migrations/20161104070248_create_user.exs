defmodule Ubxui.Repo.Migrations.CreateUser do

    use Ecto.Migration

    def change do
        create table(:users) do
            add :username, :string, size: 30
            add :email, :string, size: 120
            add :password, :string, size: 70

            timestamps()
        end

        create unique_index(:users, [:username])
        create unique_index(:users, [:email])
    end

end
