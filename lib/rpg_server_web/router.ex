defmodule RpgServerWeb.Router do
  use RpgServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RpgServerWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
  end
end
