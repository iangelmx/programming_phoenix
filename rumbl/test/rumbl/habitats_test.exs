defmodule Rumbl.HabitatsTest do
  use Rumbl.DataCase

  alias Rumbl.Habitats

  describe "aquariums" do
    alias Rumbl.Habitats.Aquarium

    @valid_attrs %{fishes_num: 42, name: "some name", water_lts: 120.5}
    @update_attrs %{fishes_num: 43, name: "some updated name", water_lts: 456.7}
    @invalid_attrs %{fishes_num: nil, name: nil, water_lts: nil}

    def aquarium_fixture(attrs \\ %{}) do
      {:ok, aquarium} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Habitats.create_aquarium()

      aquarium
    end

    test "list_aquariums/0 returns all aquariums" do
      aquarium = aquarium_fixture()
      assert Habitats.list_aquariums() == [aquarium]
    end

    test "get_aquarium!/1 returns the aquarium with given id" do
      aquarium = aquarium_fixture()
      assert Habitats.get_aquarium!(aquarium.id) == aquarium
    end

    test "create_aquarium/1 with valid data creates a aquarium" do
      assert {:ok, %Aquarium{} = aquarium} = Habitats.create_aquarium(@valid_attrs)
      assert aquarium.fishes_num == 42
      assert aquarium.name == "some name"
      assert aquarium.water_lts == 120.5
    end

    test "create_aquarium/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Habitats.create_aquarium(@invalid_attrs)
    end

    test "update_aquarium/2 with valid data updates the aquarium" do
      aquarium = aquarium_fixture()
      assert {:ok, %Aquarium{} = aquarium} = Habitats.update_aquarium(aquarium, @update_attrs)
      assert aquarium.fishes_num == 43
      assert aquarium.name == "some updated name"
      assert aquarium.water_lts == 456.7
    end

    test "update_aquarium/2 with invalid data returns error changeset" do
      aquarium = aquarium_fixture()
      assert {:error, %Ecto.Changeset{}} = Habitats.update_aquarium(aquarium, @invalid_attrs)
      assert aquarium == Habitats.get_aquarium!(aquarium.id)
    end

    test "delete_aquarium/1 deletes the aquarium" do
      aquarium = aquarium_fixture()
      assert {:ok, %Aquarium{}} = Habitats.delete_aquarium(aquarium)
      assert_raise Ecto.NoResultsError, fn -> Habitats.get_aquarium!(aquarium.id) end
    end

    test "change_aquarium/1 returns a aquarium changeset" do
      aquarium = aquarium_fixture()
      assert %Ecto.Changeset{} = Habitats.change_aquarium(aquarium)
    end
  end

  describe "aquarium_viewers" do
    alias Rumbl.Habitats.Aquariums_viewer

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def aquariums_viewer_fixture(attrs \\ %{}) do
      {:ok, aquariums_viewer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Habitats.create_aquariums_viewer()

      aquariums_viewer
    end

    test "list_aquarium_viewers/0 returns all aquarium_viewers" do
      aquariums_viewer = aquariums_viewer_fixture()
      assert Habitats.list_aquarium_viewers() == [aquariums_viewer]
    end

    test "get_aquariums_viewer!/1 returns the aquariums_viewer with given id" do
      aquariums_viewer = aquariums_viewer_fixture()
      assert Habitats.get_aquariums_viewer!(aquariums_viewer.id) == aquariums_viewer
    end

    test "create_aquariums_viewer/1 with valid data creates a aquariums_viewer" do
      assert {:ok, %Aquariums_viewer{} = aquariums_viewer} = Habitats.create_aquariums_viewer(@valid_attrs)
    end

    test "create_aquariums_viewer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Habitats.create_aquariums_viewer(@invalid_attrs)
    end

    test "update_aquariums_viewer/2 with valid data updates the aquariums_viewer" do
      aquariums_viewer = aquariums_viewer_fixture()
      assert {:ok, %Aquariums_viewer{} = aquariums_viewer} = Habitats.update_aquariums_viewer(aquariums_viewer, @update_attrs)
    end

    test "update_aquariums_viewer/2 with invalid data returns error changeset" do
      aquariums_viewer = aquariums_viewer_fixture()
      assert {:error, %Ecto.Changeset{}} = Habitats.update_aquariums_viewer(aquariums_viewer, @invalid_attrs)
      assert aquariums_viewer == Habitats.get_aquariums_viewer!(aquariums_viewer.id)
    end

    test "delete_aquariums_viewer/1 deletes the aquariums_viewer" do
      aquariums_viewer = aquariums_viewer_fixture()
      assert {:ok, %Aquariums_viewer{}} = Habitats.delete_aquariums_viewer(aquariums_viewer)
      assert_raise Ecto.NoResultsError, fn -> Habitats.get_aquariums_viewer!(aquariums_viewer.id) end
    end

    test "change_aquariums_viewer/1 returns a aquariums_viewer changeset" do
      aquariums_viewer = aquariums_viewer_fixture()
      assert %Ecto.Changeset{} = Habitats.change_aquariums_viewer(aquariums_viewer)
    end
  end
end
