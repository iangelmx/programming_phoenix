defmodule Rumbl.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset
  import Rumbl.Accounts.AccountsHelper
  alias Rumbl.Accounts.User

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @spec changeset( %User{}, map() ) :: Ecto.Changeset.t()
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
    |> unique_constraint(:username, message: "That username has been already taken...")
  end

  @spec registration_changeset(%User{}, map()) :: Ecto.Changeset.t()
  def registration_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

end
