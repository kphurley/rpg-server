defmodule RpgServer.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias RpgServer.Accounts.Credential


  schema "users" do
    field :email, :string
    field :name, :string
    field :username, :string
    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :email])
    |> validate_required([:name, :username, :email])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end
