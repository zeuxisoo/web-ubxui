# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ubxui,
  ecto_repos: [Ubxui.Repo]

# Configures the endpoint
config :ubxui, Ubxui.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WNZa1t2haaZnS6kyn1V2/QMd4hQH0MeWfBvl/O19crrbu5o1Zxmazbwnm6SDyMuV",
  render_errors: [view: Ubxui.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ubxui.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
