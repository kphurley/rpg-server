defmodule RpgServerWeb.SkillController do
  use RpgServerWeb, :controller

  alias RpgServer.Game
  alias RpgServer.Game.Skill

  action_fallback RpgServerWeb.FallbackController

  def index(conn, _params) do
    skills = Game.list_skills()
    render(conn, "index.json", skills: skills)
  end

  def create(conn, %{"skill" => skill_params}) do
    with {:ok, %Skill{} = skill} <- Game.create_skill(skill_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.skill_path(conn, :show, skill))
      |> render("show.json", skill: skill)
    end
  end

  def show(conn, %{"id" => id}) do
    skill = Game.get_skill!(id)
    render(conn, "show.json", skill: skill)
  end

  def update(conn, %{"id" => id, "skill" => skill_params}) do
    skill = Game.get_skill!(id)

    with {:ok, %Skill{} = skill} <- Game.update_skill(skill, skill_params) do
      render(conn, "show.json", skill: skill)
    end
  end

  def delete(conn, %{"id" => id}) do
    skill = Game.get_skill!(id)

    with {:ok, %Skill{}} <- Game.delete_skill(skill) do
      send_resp(conn, :no_content, "")
    end
  end
end
