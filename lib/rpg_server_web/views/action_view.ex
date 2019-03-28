defmodule RpgServerWeb.ActionView do
  use RpgServerWeb, :view
  alias RpgServerWeb.ActionView

  def render("index.json", %{actions: actions}) do
    %{data: render_many(actions, ActionView, "action.json")}
  end

  def render("show.json", %{action: action}) do
    %{data: render_one(action, ActionView, "action.json")}
  end

  def render("action.json", %{action: action}) do
    %{id: action.id,
      name: action.name,
      range: action.range,
      modifier: action.modifier,
      order: action.order,
      type: action.type,
      status: action.status}
  end
end
