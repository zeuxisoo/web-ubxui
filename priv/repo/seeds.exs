# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Ubxui.Repo.insert!(%Ubxui.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Ubxui.Repo
alias Ubxui.User

Repo.insert!(%User{
    username: "test",
    password: Comeonin.Bcrypt.hashpwsalt("testtest"),
    email: "test@test.com"
})
