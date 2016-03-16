defmodule Lutra.Repo.Migrations.AlterPost do
  use Ecto.Migration

  def change do

    alter table(:posts) do
      add :author, :string
    end
  end
end
