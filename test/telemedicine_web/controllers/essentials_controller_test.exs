defmodule TelemedicineWeb.EssentialsControllerTest do
  use TelemedicineWeb.ConnCase

  import Telemedicine.Medical_infoFixtures

  alias Telemedicine.Medical_info.Essentials

  @create_attrs %{
    "heart_beat" => %{},
    "patient_id" => 42,
    "pressure" => %{},
    "temperature" => 42
  }
  @update_attrs %{
    heart_beat: %{},
    patient_id: 43,
    pressure: %{},
    temperature: 43
  }
  @invalid_attrs %{heart_beat: nil, patient_id: nil, pressure: nil, temperature: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all essential", %{conn: conn} do
      conn = get(conn, Routes.essentials_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create essentials" do
    test "renders essentials when data is valid", %{conn: conn} do
      conn = post(conn, Routes.essentials_path(conn, :create), @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.essentials_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "heart_beat" => %{},
               "patient_id" => 42,
               "pressure" => %{},
               "temperature" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.essentials_path(conn, :create), essentials: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update essentials" do
    setup [:create_essentials]

    test "renders essentials when data is valid", %{conn: conn, essentials: %Essentials{id: id} = essentials} do
      conn = put(conn, Routes.essentials_path(conn, :update, essentials), essentials: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.essentials_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "heart_beat" => %{},
               "patient_id" => 43,
               "pressure" => %{},
               "temperature" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, essentials: essentials} do
      conn = put(conn, Routes.essentials_path(conn, :update, essentials), essentials: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete essentials" do
    setup [:create_essentials]

    test "deletes chosen essentials", %{conn: conn, essentials: essentials} do
      conn = delete(conn, Routes.essentials_path(conn, :delete, essentials))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.essentials_path(conn, :show, essentials))
      end
    end
  end

  defp create_essentials(_) do
    essentials = essentials_fixture()
    %{essentials: essentials}
  end
end
