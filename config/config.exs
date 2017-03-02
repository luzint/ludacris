# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_ludacris,
  ecto_repos: [PhoenixLudacris.Repo]

# Configures the endpoint
config :phoenix_ludacris, PhoenixLudacris.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B626PFahP9NjhmaC745Oqs13dAqEpwUT63suND81BHjNaJRokLnrjRGrT7025h9G",
  render_errors: [view: PhoenixLudacris.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixLudacris.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
