defmodule Telemedicine.Repo.Migrations.CreateEssential do
  use Ecto.Migration

  def change do
    create table(:essential) do
      add :temperature, :integer
      add :pressure, :map
      add :heart_beat, :map
      add :patient_id, :integer

      timestamps()
    end
  end
end
