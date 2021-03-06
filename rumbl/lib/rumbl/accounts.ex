defmodule Rumbl.Accounts do

  @moduledoc """
  The Accounts context.
  """

  alias Rumbl.Accounts.User
  alias Rumbl.Repo

  @spec list_users :: list( %User{} )
  def list_users do
    Repo.all(User)
  end

  @spec get_user( integer() ) :: %User{}
  def get_user(id) do
    Repo.get(User, id)
  end

  @spec get_user!( integer() ) :: any
  def get_user!(id) do
    Repo.get!(User, id)
  end

  @spec get_user_by(any) :: any
  def get_user_by(params) do
    Repo.get_by(User, params)
  end

  @spec change_user( %User{} ) :: Ecto.Changeset.t()
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @spec create_user(map() | none()) :: any
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end


  ### For end users registration

  @spec change_registration(%User{}, map()) :: any
  def change_registration(%User{} = user, params) do
    User.registration_changeset(user, params)
  end

  @spec register_user(map() | none()) :: Ecto.Changeset.t()
  def register_user(attrs \\ %{}) do
    %User{}
    |> User.registration_changeset(attrs)
    |> Repo.insert()
  end

  ### FOr loggin in

  @spec authenticate_by_username_and_pass( String.t(), String.t() ) :: tuple()
  def authenticate_by_username_and_pass(username, given_pass) do
    user = get_user_by(username: username)

    cond do
      user && Pbkdf2.verify_pass(given_pass, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        Pbkdf2.no_user_verify()
        {:error, :not_found}
    end
 	end

end
