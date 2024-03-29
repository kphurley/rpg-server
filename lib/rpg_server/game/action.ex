defmodule RpgServer.Game.Action do
  use Ecto.Schema
  import Ecto.Changeset

  alias RpgServer.Game.Skill

  @valid_types [
    "move",
    "attack",
    "inflict_status",
    "heal",
    "gain_status",
    "passive"
  ]

  @valid_statuses [
    nil,
    "stun",
    "root",
    "disarm",
    "slow",
    "weak",
    "healing",
    "armored",
    "blocking",
    "defending",
    "empowered"
  ]

  schema "actions" do
    field :modifier, :float
    field :name, :string
    field :order, :integer
    field :range, :integer

    field :type, :string
    field :status, :string

    belongs_to :skill, Skill

    timestamps()
  end

  @doc false
  def changeset(action, attrs) do
    action
    |> cast(attrs, [:name, :range, :modifier, :order, :type, :status])
    |> validate_required([:name, :range, :modifier, :order])
    |> validate_inclusion(:type, @valid_types)
    |> validate_inclusion(:status, @valid_statuses)
    |> unique_constraint(:name)
  end
end
