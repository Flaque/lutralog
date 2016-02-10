ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Lutra.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Lutra.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Lutra.Repo)

