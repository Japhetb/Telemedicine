defmodule TelemedicineWeb.DoctorController do
  use TelemedicineWeb, :controller

  alias Telemedicine.Medical_stuff
  alias Telemedicine.Medical_stuff.Doctor

  action_fallback TelemedicineWeb.FallbackController

  def index(conn, _params) do
    doctors = Medical_stuff.list_doctors()
    render(conn, "index.json", doctors: doctors)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    with {:ok, %Doctor{} = doctor} <- Medical_stuff.create_doctor(doctor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.doctor_path(conn, :show, doctor))
      |> render("show.json", doctor: doctor)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Medical_stuff.get_doctor!(id)
    render(conn, "show.json", doctor: doctor)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Medical_stuff.get_doctor!(id)

    with {:ok, %Doctor{} = doctor} <- Medical_stuff.update_doctor(doctor, doctor_params) do
      render(conn, "show.json", doctor: doctor)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Medical_stuff.get_doctor!(id)

    with {:ok, %Doctor{}} <- Medical_stuff.delete_doctor(doctor) do
      send_resp(conn, :no_content, "")
    end
  end
end
