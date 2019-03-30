defmodule RpgServerWeb.Router do
  use RpgServerWeb, :router

  alias RpgServer.Guardian

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/api", RpgServerWeb do
    pipe_through :api

    post "/users", UserController, :create
    post "/sessions", UserController, :sign_in

    post "/skills", SkillController, :create
  end

  scope "/api", RpgServerWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/my_user", UserController, :show
  end
end
