defmodule RpgServer.Game.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  alias RpgServer.Game.Action


  schema "skills" do
    field :initiative, :integer
    field :name, :string
    field :tooltip, :string

    has_many :actions, Action

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :initiative, :tooltip])
    |> validate_required([:name, :initiative, :tooltip])
  end
end
