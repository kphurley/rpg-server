defmodule RpgServerWeb.SkillView do
  use RpgServerWeb, :view
  alias RpgServerWeb.SkillView

  def render("index.json", %{skills: skills}) do
    %{data: render_many(skills, SkillView, "skill.json")}
  end

  def render("show.json", %{skill: skill}) do
    %{data: render_one(skill, SkillView, "skill.json")}
  end

  def render("skill.json", %{skill: skill}) do
    %{id: skill.id,
      name: skill.name,
      initiative: skill.initiative,
      tooltip: skill.tooltip,
      expertise: skill.expertise}
  end
end
