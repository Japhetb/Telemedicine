defmodule Telemedicine.Repo.Migrations.AlterEssentialTable do
  use Ecto.Migration

  def change do
    alter table("essential") do
      add :status, :string
    end
  end
end
