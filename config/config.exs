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

config :ueberauth, Ueberauth,
  providers: [
    facebook: {Ueberauth.Strategy.Facebook, []},
    identity: {Ueberauth.Strategy.Identity, [
        callback_methods: ["POST"],
        uid_field: :username,
        nickname_field: :username,
        ] }
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.Oauth,
  client_id: System.get_env("FACEBOOK_APP_ID"),
  client_secret: System.get_env("FACEBOOK_APP_SECRET"),
  redirect_uri: System.get_env("FACEBOOK_REDIRECT_URI")


#Generate a 126-bit oct JWK
#JOSE.JWK.generate_key({:oct, 16}) |> JOSE.JWK.to_map |> elem(1)
#%{"k" => "5fn8i7r5cRWZW_yyr9flkg", "kty" => "oct"}

config :guardian, Guardian,
  allowed_alogs: ["HS512"],
  verify_module: Guardian.JWT,  # optional
  issuer: "Ludacris",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: false, # optional
  secret_key: %{"k" => "5Fn8i7r5cRWZW_yyr9Flkg", "kty" => "oct"},
  serializer: MyApp.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
