defmodule Rumbl.Multimedia.Category do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  @spec alphabetical(Ecto.Queryable.t()) :: Ecto.Queryable.t()
  def alphabetical(query) do
    from c in query, order_by: [asc: c.name]
  end

  schema "categories" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
