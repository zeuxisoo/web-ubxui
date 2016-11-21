defmodule Ubxui.Api.ErrorView do

    use Ubxui.Web, :view

    def render("error.json", assigns) do
        %{ ok: false, message: assigns[:error][:message] }
    end

end
