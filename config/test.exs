use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rpg_server, RpgServerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rpg_server, RpgServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "rpg_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :argon2_elixir,
  t_cost: 1,
  m_cost: 8

