defmodule RpgServer.Repo.Migrations.RemoveExpertiseFromSkill do
  use Ecto.Migration

  def change do
    alter table(:skills) do
      remove :expertise
    end
  end
end
