defmodule Ubxui.Api.EventView do

    use Ubxui.Web, :view

    def render("error.json", assigns) do
        render_one(assigns, Ubxui.Api.ErrorView, "error.json")
    end

end
