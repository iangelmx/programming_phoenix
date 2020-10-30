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
alias Rumbl.Habitats.Aquarium

Rumbl.Repo.insert!(%User{name: "José", username: "josevalim"})
Rumbl.Repo.insert!(%User{name: "Bruce", username: "redrapids"})
Rumbl.Repo.insert!(%User{name: "Chris", username: "mccord"})

Rumbl.Repo.insert!( %Aquarium{fishes_num: 5, water_lts: 10.0, name: "Pecera 1"} )
Rumbl.Repo.insert!( %Aquarium{fishes_num: 10, water_lts: 15.0, name: "Pecera 2"} )
Rumbl.Repo.insert!( %Aquarium{fishes_num: 15, water_lts: 20.0, name: "Pecera 3"} )
Rumbl.Repo.insert!( %Aquarium{fishes_num: 20, water_lts: 25.0, name: "Pecera 4"} )
