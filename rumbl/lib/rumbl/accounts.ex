defmodule Rumbl.Accounts do

  @moduledoc """
    The Accounts context.
    """

  alias Rumbl.Accounts.User

  @spec list_users :: list( %User{} )
  def list_users do
    [
      %User{id: "1", name: "José", username: "josevalim"},
      %User{id: "2", name: "Bruce", username: "redrapids"},
      %User{id: "3", name: "Chris", username: "chrismccord"}
    ]
  end

  @spec get_user( String.t() ) :: %User{}
  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  @spec get_user_by(any) :: any
  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end

end
