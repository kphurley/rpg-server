defmodule RpgServer.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :rpg_server,
  module: RpgServer.Guardian,
  error_handler: RpgServer.AuthErrorHandler

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
