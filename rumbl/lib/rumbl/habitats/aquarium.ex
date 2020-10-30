defmodule Rumbl.Habitats.Aquarium do
  use Ecto.Schema
  import Ecto.Changeset

  schema "aquariums" do
    field :fishes_num, :integer
    field :name, :string
    field :water_lts, :float

    has_many :aquarium_viewers, Rumbl.Habitats.Aquariums_viewer
    has_many :users, through: [:aquarium_viewers, :user]

    timestamps()
  end

  @doc false
  def changeset(aquarium, attrs) do
    aquarium
    |> cast(attrs, [:fishes_num, :water_lts, :name])
    |> validate_required([:fishes_num, :water_lts, :name])
  end
end
