defmodule Ubxui.Api.AuthController do

    use Ubxui.Web, :controller

    alias Ubxui.Repo
    alias Ubxui.User

    def register(conn, params) do
        changeset = User.register_changeset(%User{}, params)

        case Repo.insert(changeset) do
            { :ok, _user } ->
                conn
                |> put_status(:created)
                |> json(%{ ok: true, })
            { :error, changeset } ->
                errors = changeset |> Ecto.Changeset.traverse_errors(&Ubxui.ErrorHelpers.translate_error/1)

                conn
                |> put_status(:ok)
                |> json(%{ ok: false, errors: errors })
        end
    end

    def login(conn, _params) do
        user = Repo.get(User, 1)

        case Guardian.encode_and_sign(user) do
            { :ok, token, _claims } -> json(conn, %{ ok: true, token: token })
            _                       -> json(conn, %{ ok: false, token: "" })
        end
    end

    def logout(conn, _params) do
        case Guardian.Plug.claims(conn) do
            { :ok, claims } ->
                conn
                |> Guardian.Plug.current_token
                |> Guardian.revoke!(claims)

                conn
                |> put_status(:ok)
                |> json(%{ ok: true })
            { :error, _ } ->
                conn
                |> put_status(:ok)
                |> json(%{ ok: false })
        end
    end

end
