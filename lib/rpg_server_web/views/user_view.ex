defmodule RpgServerWeb.UserView do
  use RpgServerWeb, :view
  alias RpgServerWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("jwt.json", %{jwt: jwt, user: user}) do
    %{jwt: jwt, user_id: user.id}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email
    }
  end
end
