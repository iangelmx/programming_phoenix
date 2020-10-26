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

end
