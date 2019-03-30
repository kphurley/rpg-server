defmodule RpgServerWeb.ActionController do
  use RpgServerWeb, :controller

  alias RpgServer.Game
  alias RpgServer.Game.Action

  action_fallback RpgServerWeb.FallbackController

  def index(conn, _params) do
    actions = Game.list_actions()
    render(conn, "index.json", actions: actions)
  end

  def create(conn, %{"action" => action_params}) do
    with {:ok, %Action{} = action} <- Game.create_action(action_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.action_path(conn, :show, action))
      |> render("show.json", action: action)
    end
  end

  def show(conn, %{"id" => id}) do
    action = Game.get_action!(id)
    render(conn, "show.json", action: action)
  end

  def update(conn, %{"id" => id, "action" => action_params}) do
    action = Game.get_action!(id)

    with {:ok, %Action{} = action} <- Game.update_action(action, action_params) do
      render(conn, "show.json", action: action)
    end
  end

  def delete(conn, %{"id" => id}) do
    action = Game.get_action!(id)

    with {:ok, %Action{}} <- Game.delete_action(action) do
      send_resp(conn, :no_content, "")
    end
  end
end
