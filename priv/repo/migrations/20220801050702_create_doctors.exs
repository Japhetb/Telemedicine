defmodule Telemedicine.Repo.Migrations.CreateDoctors do
  use Ecto.Migration

  def change do
    create table(:doctors) do
      add :email, :string
      add :username, :string
      add :password_hash, :string

      timestamps()
    end
  end
end
