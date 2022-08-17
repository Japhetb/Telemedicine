defmodule TelemedicineWeb.EssentialsView do
  use TelemedicineWeb, :view
  alias TelemedicineWeb.EssentialsView

  def render("index.json", %{essential: essential}) do
    %{data: render_many(essential, EssentialsView, "essentials.json")}
  end

  def render("show.json", %{essentials: essentials}) do
    %{data: render_one(essentials, EssentialsView, "essentials.json")}
  end

  def render("essentials.json", %{essentials: essentials}) do
    %{
      id: essentials.id,
      temperature: essentials.temperature,
      pressure: essentials.pressure,
      heart_beat: essentials.heart_beat,
      patient_id: essentials.patient_id
    }
  end
end
