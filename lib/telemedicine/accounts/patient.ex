defmodule Telemedicine.Accounts.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  schema "patients" do
    field :date_of_birth, :utc_datetime
    field :first_name, :string
    field :gender, :string
    field :id_birth_cert, :string
    field :last_name, :string
    field :location, :string
    field :profile_image, :string

    timestamps()
  end

  @gender ["Male", "Female", "Other"]

  @doc false
  def changeset(patient, attrs) do
    patient
    |> cast(attrs, [
      :first_name,
      :last_name,
      :location,
      :profile_image,
      :gender,
      :date_of_birth,
      :id_birth_cert
    ])
    |> validate_required([
      :first_name,
      :last_name,
      :location,
      :gender,
      :date_of_birth,
      :id_birth_cert
    ])
    |> validate_inclusion(:gender, @gender)
    |> unique_constraint(:id_birth_cert)
  end
end
