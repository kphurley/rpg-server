defmodule RpgServerWeb.Router do
  use RpgServerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RpgServerWeb do
    pipe_through :api

    resources "/users", UserController, only: [:create, :show]
  end
end
