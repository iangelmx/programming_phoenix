defmodule Rumbl.Repo.Migrations.CreateAquariumViewers do
  use Ecto.Migration

  def change do
    create table(:aquarium_viewers) do
      add :aquarium_id, references(:aquariums, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:aquarium_viewers, [:aquarium_id])
    create index(:aquarium_viewers, [:user_id])
    create unique_index(:aquarium_viewers, [:aquarium_id, :user_id])
  end
end
