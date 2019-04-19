defmodule RpgServer.Accounts do
  import Ecto.Query, warn: false
  alias RpgServer.Repo
  alias RpgServer.Accounts.{User, Credential}
  alias RpgServer.Guardian

  def list_users do
    User
    |> Repo.all()
    |> Repo.preload(:credential)
  end

  def get_user!(id) do
    User
    |> Repo.get!(id)
    |> Repo.preload(:credential)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Ecto.Changeset.cast_assoc(:credential, with: &Credential.changeset/2)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def update_credential(%Credential{} = credential, attrs) do
    credential
    |> Credential.changeset(attrs)
    |> Repo.update()
  end

  def token_sign_in(email, password) do
    case email_password_auth(email, password) do
      {:ok, user} ->
        { :ok, token, claims } = Guardian.encode_and_sign(user)
        { :ok, token, user, claims}
      _ ->
        {:error, :unauthorized}
    end
  end

  defp email_password_auth(email, password) do
    query = from(u in User, where: u.email == ^email)
    query
    |> Repo.one()
    |> Repo.preload(:credential)
    |> verify_password(password)
  end

  defp verify_password(nil, _) do
    # Perform a dummy check to make user enumeration more difficult
    Argon2.no_user_verify()
    {:error, "Wrong email or password"}
  end

  defp verify_password(user, password) do
    if Argon2.verify_pass(password, user.credential.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end
end
