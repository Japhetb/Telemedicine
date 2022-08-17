defmodule Telemedicine.Medical_infoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Telemedicine.Medical_info` context.
  """

  @doc """
  Generate a essentials.
  """
  def essentials_fixture(attrs \\ %{}) do
    {:ok, essentials} =
      attrs
      |> Enum.into(%{
        heart_beat: %{},
        patient_id: 42,
        pressure: %{},
        temperature: 42
      })
      |> Telemedicine.Medical_info.create_essentials()

    essentials
  end
end
