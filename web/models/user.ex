defmodule Ubxui.User do

    use Ubxui.Web, :model

    schema "users" do
        field :username, :string
        field :email, :string
        field :password, :string

        timestamps()
    end

    def register_changeset(struct, params \\ %{}) do
        struct
            |> cast(params, [:username, :email, :password])
            |> validate_required([:username, :email, :password], message: "Cannot be blank")
            |> validate_length(:username, min: 3)
            |> validate_length(:password, min: 8)
            |> validate_format(:email, ~r/@/, message: "Invalid email format")
            |> validate_confirmation(:password)
            |> unique_constraint(:username)
            |> unique_constraint(:email)
    end

end
