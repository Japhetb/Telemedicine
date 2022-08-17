defmodule TelemedicineWeb.EssentialsController do
  use TelemedicineWeb, :controller

  alias Telemedicine.Medical_info
  alias Telemedicine.Medical_info.Essentials

  action_fallback TelemedicineWeb.FallbackController

  def index(conn, _params) do
    essential = Medical_info.list_essential()
    render(conn, "index.json", essential: essential)
  end

  def create(conn, %{"essentials" => essentials_params}) do
    with {:ok, %Essentials{} = essentials} <- Medical_info.create_essentials(essentials_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.essentials_path(conn, :show, essentials))
      |> render("show.json", essentials: essentials)
    end
  end

  def show(conn, %{"id" => id}) do
    essentials = Medical_info.get_essentials!(id)
    render(conn, "show.json", essentials: essentials)
  end

  def update(conn, %{"id" => id, "essentials" => essentials_params}) do
    essentials = Medical_info.get_essentials!(id)

    with {:ok, %Essentials{} = essentials} <- Medical_info.update_essentials(essentials, essentials_params) do
      render(conn, "show.json", essentials: essentials)
    end
  end

  def delete(conn, %{"id" => id}) do
    essentials = Medical_info.get_essentials!(id)

    with {:ok, %Essentials{}} <- Medical_info.delete_essentials(essentials) do
      send_resp(conn, :no_content, "")
    end
  end
end
