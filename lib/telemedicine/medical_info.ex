defmodule Telemedicine.Medical_info do
  @moduledoc """
  The Medical_info context.
  """

  import Ecto.Query, warn: false
  alias Telemedicine.Repo

  alias Telemedicine.Medical_info.Essentials
  alias Telemedicine.PythonHelper

  def list_essential do
    Repo.all(Essentials)
  end

  def get_essentials!(id), do: Repo.get!(Essentials, id)

  def create_essentials(%{"patient_id" => patient_id} = _attrs) do
    attrs = get_medical_info(patient_id)

    %Essentials{}
    |> Essentials.changeset(attrs)
    |> Repo.insert()
  end


  def get_medical_info(patient_id) do
    path = [:code.priv_dir(:telemedicine), "python"] |> Path.join() |> to_charlist()
    {:ok, pid} = PythonHelper.start_instance(path, 'python3')
    temp = PythonHelper.call_instance(pid, :hello, :temp, ["World"])
    pressure = PythonHelper.call_instance(pid, :hello, :pressure, ["World"])
    heartbeat = PythonHelper.call_instance(pid, :hello, :heartbeat, ["World"])

    %{"temp" => temp, "pressure" => %{pressure: pressure}, "heart_beat" => %{"heart_beat" => heartbeat}, "patient_id" => patient_id}
  end


  def update_essentials(%Essentials{} = essentials, attrs) do
    essentials
    |> Essentials.changeset(attrs)
    |> Repo.update()
  end

  def delete_essentials(%Essentials{} = essentials) do
    Repo.delete(essentials)
  end

  def change_essentials(%Essentials{} = essentials, attrs \\ %{}) do
    Essentials.changeset(essentials, attrs)
  end
end
