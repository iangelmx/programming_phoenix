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

Rumbl.Repo.insert!(%User{name: "José", username: "josevalim"})
Rumbl.Repo.insert!(%User{name: "Bruce", username: "redrapids"})
Rumbl.Repo.insert!(%User{name: "Chris", username: "mccord"})
