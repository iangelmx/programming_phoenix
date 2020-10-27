defmodule Rumbl.Accounts.AccountsHelper do

  use Ecto.Schema
  import Ecto.Changeset

  def put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
      _ ->
        changeset
    end
 end
end
