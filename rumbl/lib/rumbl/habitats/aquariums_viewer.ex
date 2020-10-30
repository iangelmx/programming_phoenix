defmodule Rumbl.Habitats.Aquariums_viewer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "aquarium_viewers" do
    belongs_to :aquarium, Rumbl.Habitats.Aquarium
    belongs_to :user_id, Rumbl.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(aquariums_viewer, attrs) do
    aquariums_viewer
    |> cast(attrs, [])
    #|> unique_constraint(:name, name: :taggings_tag_id_product_id_index)
    #|> validate_required([])
    |> IO.inspect(label: "Changeset received")
    |> cast_assoc(:aquarium)
  end
end
