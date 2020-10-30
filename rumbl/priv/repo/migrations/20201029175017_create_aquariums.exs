defmodule Rumbl.Repo.Migrations.CreateAquariums do
  use Ecto.Migration

  def change do
    create table(:aquariums) do
      add :fishes_num, :integer
      add :water_lts, :float
      add :name, :string

      timestamps()
    end

  end
end
