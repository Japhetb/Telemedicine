defmodule Telemedicine.Medical_stuff do
  @moduledoc """
  The Medical_stuff context.
  """

  import Ecto.Query, warn: false
  alias Telemedicine.Repo

  alias Telemedicine.Medical_stuff.Doctor

  @doc """
  Returns the list of doctors.

  ## Examples

      iex> list_doctors()
      [%Doctor{}, ...]

  """
  def list_doctors do
    Repo.all(Doctor)
  end

  def get_by_email(email) do
    case Repo.get_by(Doctor, email: email) do
      nil ->
        {:error, :not_found}

      doctor ->
        {:ok, doctor}
    end
  end

  def get_doctor!(id), do: Repo.get!(Doctor, id)

  def create_doctor(attrs \\ %{}) do
    %Doctor{}
    |> Doctor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a doctor.

  ## Examples

      iex> update_doctor(doctor, %{field: new_value})
      {:ok, %Doctor{}}

      iex> update_doctor(doctor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_doctor(%Doctor{} = doctor, attrs) do
    doctor
    |> Doctor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a doctor.

  ## Examples

      iex> delete_doctor(doctor)
      {:ok, %Doctor{}}

      iex> delete_doctor(doctor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_doctor(%Doctor{} = doctor) do
    Repo.delete(doctor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking doctor changes.

  ## Examples

      iex> change_doctor(doctor)
      %Ecto.Changeset{data: %Doctor{}}

  """
  def change_doctor(%Doctor{} = doctor, attrs \\ %{}) do
    Doctor.changeset(doctor, attrs)
  end
end
