defmodule Telemedicine.Medical_info.Essentials do
  use Ecto.Schema
  import Ecto.Changeset

  schema "essential" do
    field :heart_beat, :map
    field :patient_id, :integer
    field :pressure, :map
    field :temperature, :integer

    timestamps()
  end

  @doc false
  def changeset(essentials, attrs) do
    essentials
    |> cast(attrs, [:temperature, :pressure, :heart_beat, :patient_id])
    |> validate_required([:temperature, :pressure, :heart_beat, :patient_id])
  end

  
end
