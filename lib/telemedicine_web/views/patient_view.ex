defmodule TelemedicineWeb.PatientView do
  use TelemedicineWeb, :view
  alias TelemedicineWeb.PatientView

  def render("index.json", %{patients: patients}) do
    %{data: render_many(patients, PatientView, "patient.json")}
  end

  def render("show.json", %{patient: patient}) do
    %{data: render_one(patient, PatientView, "patient.json")}
  end

  def render("patient.json", %{patient: patient}) do
    %{
      id: patient.id,
      first_name: patient.first_name,
      last_name: patient.last_name,
      location: patient.location,
      profile_image: patient.profile_image,
      gender: patient.gender,
      date_of_birth: patient.date_of_birth,
      id_birth_cert: patient.id_birth_cert
    }
  end
end
