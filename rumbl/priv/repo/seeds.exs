# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rumbl.Accounts.User
alias Rumbl.Multimedia

#Creates default users
Rumbl.Repo.insert!(%User{name: "José", username: "josevalim"}, on_conflict: :nothing)
Rumbl.Repo.insert!(%User{name: "Bruce", username: "redrapids"}, on_conflict: :nothing)
Rumbl.Repo.insert!(%User{name: "Chris", username: "mccord"}, on_conflict: :nothing)

#Creates default tags
for category <- ~w(Action Drama Romance Comedy Sci-fi Music) do
  Multimedia.create_category!(category)
end
