defmodule Ubxui.Api.EventController do

    use Ubxui.Web, :controller

    def search(conn, _params) do
        json(conn, %{
            ok: true
        })
    end

end
