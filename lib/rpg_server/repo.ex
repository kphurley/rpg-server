defmodule RpgServer.Repo do
  use Ecto.Repo,
    otp_app: :rpg_server,
    adapter: Ecto.Adapters.Postgres
end
