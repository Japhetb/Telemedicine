defmodule Telemedicine.Medical_stuffFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Telemedicine.Medical_stuff` context.
  """

  @doc """
  Generate a doctor.
  """
  def doctor_fixture(attrs \\ %{}) do
    {:ok, doctor} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password_hash: "some password_hash",
        username: "some username"
      })
      |> Telemedicine.Medical_stuff.create_doctor()

    doctor
  end
end
