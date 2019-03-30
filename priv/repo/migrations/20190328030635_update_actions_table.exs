defmodule RpgServer.Repo.Migrations.UpdateActionsTable do
  use Ecto.Migration

  def change do
    alter table(:actions) do
      modify :name, :string, null: false
      modify :range, :integer, null: false
      modify :modifier, :float, null: false
      modify :order, :integer, null: false

      add :type, :string
      add :status, :string
    end

    create unique_index(:actions, [:name])
  end
end
