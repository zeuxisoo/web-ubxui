defmodule Ubxui.Mixfile do

    use Mix.Project

    def project do
        [
            app: :ubxui,
            version: "0.0.1",
            elixir: "~> 1.2",
            elixirc_paths: elixirc_paths(Mix.env),
            compilers: [:phoenix, :gettext] ++ Mix.compilers,
            build_embedded: Mix.env == :prod,
            start_permanent: Mix.env == :prod,
            aliases: aliases(),
            deps: deps()
        ]
    end

    def application do
        [
            mod: {Ubxui, []},
            applications: [
                :phoenix,
                :phoenix_pubsub,
                :phoenix_html,
                :cowboy,
                :logger,
                :gettext,
                :phoenix_ecto,
                :postgrex,
                :comeonin,
                :httpotion
            ]
        ]
    end

    defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
    defp elixirc_paths(_),     do: ["lib", "web"]

    defp deps do
        [
            {:phoenix, "~> 1.2.1"},
            {:phoenix_pubsub, "~> 1.0"},
            {:phoenix_ecto, "~> 3.0"},
            {:postgrex, ">= 0.0.0"},
            {:phoenix_html, "~> 2.6"},
            {:phoenix_live_reload, "~> 1.0", only: :dev},
            {:gettext, "~> 0.11"},
            {:cowboy, "~> 1.0"},
            {:comeonin, "~> 2.5"},
            {:guardian, "~> 0.13.0"},
            {:guardian_db, github: "hassox/guardian_db", ref: "9868a0725ddae6eeb82d3bdbac9a865a4c664f6d" },
            {:exubx, "~> 0.1.0"},

            # Fix ecto and exubx poison conflic
            {:poison, "~> 3.0", override: true},
        ]
    end

    defp aliases do
        [
            "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
            "ecto.reset": ["ecto.drop", "ecto.setup"],
            "test": ["ecto.create --quiet", "ecto.migrate", "test"]
        ]
    end

end
