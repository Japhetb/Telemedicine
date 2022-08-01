defmodule TelemedicineWeb.DoctorView do
  use TelemedicineWeb, :view
  alias TelemedicineWeb.DoctorView

  def render("index.json", %{doctors: doctors}) do
    %{data: render_many(doctors, DoctorView, "doctor.json")}
  end

  def render("show.json", %{doctor: doctor}) do
    %{data: render_one(doctor, DoctorView, "doctor.json")}
  end

  def render("doctor.json", %{doctor: doctor}) do
    %{
      id: doctor.id,
      email: doctor.email,
      username: doctor.username,
      password_hash: doctor.password_hash
    }
  end
end
