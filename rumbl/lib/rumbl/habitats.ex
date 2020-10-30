defmodule Rumbl.Habitats do
  @moduledoc """
  The Habitats context.
  """

  import Ecto.Query, warn: false
  alias Rumbl.Repo

  alias Rumbl.Habitats.Aquarium

  @doc """
  Returns the list of aquariums.

  ## Examples

      iex> list_aquariums()
      [%Aquarium{}, ...]

  """
  def list_aquariums do
    Repo.all(Aquarium)
  end

  @doc """
  Gets a single aquarium.

  Raises `Ecto.NoResultsError` if the Aquarium does not exist.

  ## Examples

      iex> get_aquarium!(123)
      %Aquarium{}

      iex> get_aquarium!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aquarium!(id), do: Repo.get!(Aquarium, id)

  @doc """
  Creates a aquarium.

  ## Examples

      iex> create_aquarium(%{field: value})
      {:ok, %Aquarium{}}

      iex> create_aquarium(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aquarium(attrs \\ %{}) do
    %Aquarium{}
    |> Aquarium.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aquarium.

  ## Examples

      iex> update_aquarium(aquarium, %{field: new_value})
      {:ok, %Aquarium{}}

      iex> update_aquarium(aquarium, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aquarium(%Aquarium{} = aquarium, attrs) do
    aquarium
    |> Aquarium.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a aquarium.

  ## Examples

      iex> delete_aquarium(aquarium)
      {:ok, %Aquarium{}}

      iex> delete_aquarium(aquarium)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aquarium(%Aquarium{} = aquarium) do
    Repo.delete(aquarium)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aquarium changes.

  ## Examples

      iex> change_aquarium(aquarium)
      %Ecto.Changeset{data: %Aquarium{}}

  """
  def change_aquarium(%Aquarium{} = aquarium, attrs \\ %{}) do
    Aquarium.changeset(aquarium, attrs)
  end

  alias Rumbl.Habitats.Aquariums_viewer

  @doc """
  Returns the list of aquarium_viewers.

  ## Examples

      iex> list_aquarium_viewers()
      [%Aquariums_viewer{}, ...]

  """
  def list_aquarium_viewers do
    Repo.all(Aquariums_viewer)
  end

  @doc """
  Gets a single aquariums_viewer.

  Raises `Ecto.NoResultsError` if the Aquariums viewer does not exist.

  ## Examples

      iex> get_aquariums_viewer!(123)
      %Aquariums_viewer{}

      iex> get_aquariums_viewer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aquariums_viewer!(id), do: Repo.get!(Aquariums_viewer, id)

  @doc """
  Creates a aquariums_viewer.

  ## Examples

      iex> create_aquariums_viewer(%{field: value})
      {:ok, %Aquariums_viewer{}}

      iex> create_aquariums_viewer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aquariums_viewer(attrs \\ %{}) do
    %Aquariums_viewer{}
    |> Aquariums_viewer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aquariums_viewer.

  ## Examples

      iex> update_aquariums_viewer(aquariums_viewer, %{field: new_value})
      {:ok, %Aquariums_viewer{}}

      iex> update_aquariums_viewer(aquariums_viewer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aquariums_viewer(%Aquariums_viewer{} = aquariums_viewer, attrs) do
    aquariums_viewer
    |> Aquariums_viewer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a aquariums_viewer.

  ## Examples

      iex> delete_aquariums_viewer(aquariums_viewer)
      {:ok, %Aquariums_viewer{}}

      iex> delete_aquariums_viewer(aquariums_viewer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aquariums_viewer(%Aquariums_viewer{} = aquariums_viewer) do
    Repo.delete(aquariums_viewer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aquariums_viewer changes.

  ## Examples

      iex> change_aquariums_viewer(aquariums_viewer)
      %Ecto.Changeset{data: %Aquariums_viewer{}}

  """
  def change_aquariums_viewer(%Aquariums_viewer{} = aquariums_viewer, attrs \\ %{}) do
    Aquariums_viewer.changeset(aquariums_viewer, attrs)
  end

  def aquarium_user(user, %{aquarium: aquarium_attrs} = attrs) do
    aquarium = create_or_find_aquarium(aquarium_attrs)

    IO.inspect(attrs, label: "Atts to cast assoc")
    user
    |> Ecto.build_assoc(:aquarium_viewers)
    |> IO.inspect(label: "Hey 1")
    |> Aquariums_viewer.changeset(attrs)
    |> IO.inspect(label: "Hey 2")
    |> Ecto.Changeset.put_assoc(:aquarium, aquarium)
    |> IO.inspect(label: "Hey 3")
    |> Repo.insert()
  end

  defp create_or_find_aquarium(%{fishes_num: f_num } = attrs) do
    %Aquarium{}
    |> Aquarium.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, aquarium} -> aquarium
      #|> IO.inspect(label: "Created aquarium")
      _ -> Repo.get_by(Aquarium, fishes_num: f_num )
      #|> IO.inspect(label: "Aquarium retrieved")
    end
  end
  defp create_or_find_aquarium(_), do: nil

  # defp find_or_create_aquarium(%{fishes_num: f_num } = attrs) do
  #   Repo.get_by(Aquarium, fishes_num: f_num)
  #   |> case do
  #     %Aquariums_viewer{} ->
  #   end

  #   %Aquarium{}
  #   |> Aquarium.changeset(attrs)
  #   |>
  #   |> case do
  #     {:ok, aquarium} -> aquarium
  #     #|> IO.inspect(label: "Created aquarium")
  #     _ -> Repo.get_by(Aquarium, fishes_num: f_num )
  #     #|> IO.inspect(label: "Aquarium retrieved")
  #   end
  # end
  # defp find_or_create_aquarium(_), do: nil

  def delete_aquarium_from_user(user, aquarium) do
    Repo.get_by(Aquariums_viewer, user_id: user.id, aquarium_id: aquarium.id)
    |> case do
      %Aquariums_viewer{} = aquariums_viewer -> Repo.delete(aquariums_viewer)
      nil -> {:ok, %Aquariums_viewer{}}
    end
  end


end
