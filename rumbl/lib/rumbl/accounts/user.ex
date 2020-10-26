defmodule Rumbl.Accounts.User do

  use Ecto.Schema
  import Ecto.Changeset
  alias Rumbl.Accounts.User

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  @spec changeset( %User{}, map() ) :: Ecto.Changeset.t()
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end

end
