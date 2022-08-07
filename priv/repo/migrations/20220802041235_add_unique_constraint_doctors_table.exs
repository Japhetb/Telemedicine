defmodule Telemedicine.Repo.Migrations.AddUniqueConstraintDoctorsTable do
  use Ecto.Migration

  def change do
    create unique_index("doctors", [:email])
  end
end
