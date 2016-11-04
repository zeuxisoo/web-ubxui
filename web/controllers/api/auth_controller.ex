defmodule Ubxui.Api.AuthController do

    use Ubxui.Web, :controller

    alias Ubxui.Repo
    alias Ubxui.User

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
                |> put_status(:unprocessable_entity)
                |> json(%{ ok: false })
        end
    end

end
