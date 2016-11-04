defmodule Ubxui.User do

    use Ubxui.Web, :model

    schema "users" do
        field :username, :string
        field :email, :string
        field :password, :string

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
            |> cast(params, [:username, :email, :password])
            |> validate_required([:username, :email, :password])
    end

end
