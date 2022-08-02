defmodule Telemedicine.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Telemedicine.Accounts` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        date_of_birth: ~U[2022-08-01 10:39:00Z],
        first_name: "some first_name",
        gender: "some gender",
        id_birth_cert: "some id_birth_cert",
        last_name: "some last_name",
        location: "some location",
        profile_image: "some profile_image"
      })
      |> Telemedicine.Accounts.create_patient()

    patient
  end
end
