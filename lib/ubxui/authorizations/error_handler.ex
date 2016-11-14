defmodule Ubxui.Authorizations.ErrorHandler do

    import Plug.Conn, only: [put_status: 2]
    import Phoenix.Controller, only: [json: 2]

    def unauthenticated(conn, _params) do
        status   = :unauthorized
        response = %{
            ok: false,
            error: status,
            message: "Please login first!"
        }

        conn
        |> put_status(status)
        |> json(response)
    end

end
