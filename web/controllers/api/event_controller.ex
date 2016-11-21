defmodule Ubxui.Api.EventController do

    use Ubxui.Web, :controller

    def search(conn, params) do
        event_id = params["event_id"]

        if event_id == nil || event_id == "" do
            render_error(conn, "Please provide event id")
        else
            auth = ExUbx.fetch_auth()

            if ExUbx.Validator.has_auth_token?(auth) === false do
                render_error(conn, "Cannot got valid auth token")
            else
                case Integer.parse(event_id) do
                    { event_id, _ } ->
                        performance = ExUbx.fetch_performance(auth.cookie, event_id)

                        if ExUbx.Validator.has_performances?(performance) === false do
                            render_error(conn, "Cannot got the performance file")
                        else
                            performances = ExUbx.convert_performances(performance)

                            # Reformat performances
                            events = [] ++ for performance <- performances do
                                %{
                                    id: performance["eventId"],
                                    name: performance["performanceName"],
                                    date: performance["performanceDateTime"] |> div(1000) |> DateTime.from_unix! |> DateTime.to_string,
                                    status: performance["status"],
                                }
                            end

                            conn
                            |> put_status(:ok)
                            |> json(%{ ok: true, events: events })
                        end

                    :error ->
                        render_error(conn, "Event id is not integer")
                end
            end
        end
    end

    defp render_error(conn, message) do
        conn
        |> put_status(:ok)
        |> render("error.json", message: message)
    end

end
