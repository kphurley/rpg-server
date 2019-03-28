defmodule RpgServer.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string, null: false
      add :initiative, :integer, null: false
      add :tooltip, :string, null: false
      add :expertise, :float, null: false

      timestamps()
    end

    alter table(:actions) do
      add :skill_id, references(:skills, on_delete: :delete_all), null: false
    end

    create unique_index(:skills, [:name])
  end
end
