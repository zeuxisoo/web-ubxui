defmodule Ubxui.Api.UserController do

    use Ubxui.Web, :controller

    def profile(conn, _params) do
        current_user = conn.assigns[:current_user]
        response     = %{
            ok: true,
            user: %{
                id: current_user.id,
                username: current_user.username,
                email: current_user.email
            }
        }

        json(conn, response)
    end

end
