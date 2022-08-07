defmodule Telemedicine.Repo.Migrations.AlterPatientTable do
  use Ecto.Migration

  def change do
    alter table("patients") do
      modify :date_of_birth, :string
    end
  end
end
