defmodule Telemedicine.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients) do
      add :first_name, :string
      add :last_name, :string
      add :location, :string
      add :profile_image, :string
      add :gender, :string
      add :date_of_birth, :utc_datetime
      add :id_birth_cert, :string

      timestamps()
    end

    create unique_index("patients", [:id_birth_cert])
  end
end
