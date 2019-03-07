# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rpg_server,
  ecto_repos: [RpgServer.Repo]

# Configures the endpoint
config :rpg_server, RpgServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yhRPKy3zRyLZwAzcPolVGtrAFLUtodEB4GqHgym+CMNZWbS4u+fHVX/0l6Pu7Olp",
  render_errors: [view: RpgServerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: RpgServer.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config
config :rpg_server, RpgServer.Guardian,
  issuer: "rpgServer",
  secret_key: "Secret key. Use `mix guardian.gen.secret` to generate one"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
