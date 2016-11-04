defmodule Ubxui.Authorizations.SuccessHandler do

    import Plug.Conn, only: [assign: 3]

    def init(_) do
        nil
    end

    def call(conn, _opts) do
        current_user = Guardian.Plug.current_resource(conn)

        conn
        |> assign(:current_user, current_user)
    end

end
