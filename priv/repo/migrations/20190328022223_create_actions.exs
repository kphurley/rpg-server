defmodule RpgServer.Repo.Migrations.CreateActions do
  use Ecto.Migration

  def change do
    create table(:actions) do
      add :name, :string
      add :range, :integer
      add :modifier, :float
      add :order, :integer

      timestamps()
    end

  end
end
