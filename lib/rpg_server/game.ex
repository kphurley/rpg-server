defmodule RpgServer.Game do
  import Ecto.Query, warn: false
  alias RpgServer.Repo

  alias RpgServer.Game.Action
  alias RpgServer.Game.Skill
  def list_actions do
    Repo.all(Action)
  end

  def get_action!(id), do: Repo.get!(Action, id)

  def create_action(attrs \\ %{}) do
    %Action{}
    |> Action.changeset(attrs)
    |> Repo.insert()
  end

  def update_action(%Action{} = action, attrs) do
    action
    |> Action.changeset(attrs)
    |> Repo.update()
  end

  def delete_action(%Action{} = action) do
    Repo.delete(action)
  end

  def change_action(%Action{} = action) do
    Action.changeset(action, %{})
  end

  def list_skills do
    Repo.all(Skill)
  end

  def get_skill!(id), do: Repo.get!(Skill, id)

  def create_skill(attrs \\ %{}) do
    %Skill{}
    |> Skill.changeset(attrs)
    |> Ecto.Changeset.cast(attrs, [])
    |> Ecto.Changeset.cast_assoc(:actions, with: &Action.changeset/2)
    |> Repo.insert()
  end

  def update_skill(%Skill{} = skill, attrs) do
    skill
    |> Skill.changeset(attrs)
    |> Repo.update()
  end

  def delete_skill(%Skill{} = skill) do
    Repo.delete(skill)
  end

  def change_skill(%Skill{} = skill) do
    Skill.changeset(skill, %{})
  end
end
