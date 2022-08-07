defmodule TelemedicineWeb.PatientControllerTest do
  use TelemedicineWeb.ConnCase

  import Telemedicine.AccountsFixtures

  alias Telemedicine.Accounts.Patient

  @create_attrs %{
    date_of_birth: ~U[2022-08-01 10:39:00Z],
    first_name: "some first_name",
    gender: "some gender",
    id_birth_cert: "some id_birth_cert",
    last_name: "some last_name",
    location: "some location",
    profile_image: "some profile_image"
  }
  @update_attrs %{
    date_of_birth: ~U[2022-08-02 10:39:00Z],
    first_name: "some updated first_name",
    gender: "some updated gender",
    id_birth_cert: "some updated id_birth_cert",
    last_name: "some updated last_name",
    location: "some updated location",
    profile_image: "some updated profile_image"
  }
  @invalid_attrs %{
    date_of_birth: nil,
    first_name: nil,
    gender: nil,
    id_birth_cert: nil,
    last_name: nil,
    location: nil,
    profile_image: nil
  }

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all patients", %{conn: conn} do
      conn = get(conn, Routes.patient_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create patient" do
    test "renders patient when data is valid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.patient_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "date_of_birth" => "2022-08-01T10:39:00Z",
               "first_name" => "some first_name",
               "gender" => "some gender",
               "id_birth_cert" => "some id_birth_cert",
               "last_name" => "some last_name",
               "location" => "some location",
               "profile_image" => "some profile_image"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.patient_path(conn, :create), patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update patient" do
    setup [:create_patient]

    test "renders patient when data is valid", %{conn: conn, patient: %Patient{id: id} = patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.patient_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "date_of_birth" => "2022-08-02T10:39:00Z",
               "first_name" => "some updated first_name",
               "gender" => "some updated gender",
               "id_birth_cert" => "some updated id_birth_cert",
               "last_name" => "some updated last_name",
               "location" => "some updated location",
               "profile_image" => "some updated profile_image"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, patient: patient} do
      conn = put(conn, Routes.patient_path(conn, :update, patient), patient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete patient" do
    setup [:create_patient]

    test "deletes chosen patient", %{conn: conn, patient: patient} do
      conn = delete(conn, Routes.patient_path(conn, :delete, patient))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.patient_path(conn, :show, patient))
      end
    end
  end

  defp create_patient(_) do
    patient = patient_fixture()
    %{patient: patient}
  end
end
