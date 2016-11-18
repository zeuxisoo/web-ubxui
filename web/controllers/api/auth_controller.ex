defmodule Ubxui.Api.AuthController do

    use Ubxui.Web, :controller

    import Ecto.Query, only: [from: 2]

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

    def login(conn, params) do
        changeset = User.login_changeset(%User{}, params)

        # Check user exists state, password correct state
        query = from u in User, where: u.username == ^params["username"]
        user  = Repo.one(query)

        if is_nil(user) do
            changeset = Ecto.Changeset.add_error(changeset, :username, "cannot found")
        end

        if is_nil(user) == false && User.valid_password?(user, params["password"]) == false do
            changeset = Ecto.Changeset.add_error(changeset, :password, "incorrect")
        end

        # Process changeset checking
        if changeset.valid? do
            case Guardian.encode_and_sign(user) do
                { :ok, token, _claims } -> json(conn, %{ ok: true, token: token })
                _                       -> json(conn, %{ ok: false, token: nil })
            end
        else
            errors = changeset |> Ecto.Changeset.traverse_errors(&Ubxui.ErrorHelpers.translate_error/1)

            conn
            |> put_status(:ok)
            |> json(%{ ok: false, errors: errors })
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
