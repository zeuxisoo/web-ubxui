defmodule Ubxui.PageController do
  use Ubxui.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
