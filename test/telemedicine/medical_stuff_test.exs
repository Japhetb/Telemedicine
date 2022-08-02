defmodule Telemedicine.Medical_stuffTest do
  use Telemedicine.DataCase

  alias Telemedicine.Medical_stuff

  describe "doctors" do
    alias Telemedicine.Medical_stuff.Doctor

    import Telemedicine.Medical_stuffFixtures

    @invalid_attrs %{email: nil, password_hash: nil, username: nil}

    test "list_doctors/0 returns all doctors" do
      doctor = doctor_fixture()
      assert Medical_stuff.list_doctors() == [doctor]
    end

    test "get_doctor!/1 returns the doctor with given id" do
      doctor = doctor_fixture()
      assert Medical_stuff.get_doctor!(doctor.id) == doctor
    end

    test "create_doctor/1 with valid data creates a doctor" do
      valid_attrs = %{
        email: "some email",
        password_hash: "some password_hash",
        username: "some username"
      }

      assert {:ok, %Doctor{} = doctor} = Medical_stuff.create_doctor(valid_attrs)
      assert doctor.email == "some email"
      assert doctor.password_hash == "some password_hash"
      assert doctor.username == "some username"
    end

    test "create_doctor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medical_stuff.create_doctor(@invalid_attrs)
    end

    test "update_doctor/2 with valid data updates the doctor" do
      doctor = doctor_fixture()

      update_attrs = %{
        email: "some updated email",
        password_hash: "some updated password_hash",
        username: "some updated username"
      }

      assert {:ok, %Doctor{} = doctor} = Medical_stuff.update_doctor(doctor, update_attrs)
      assert doctor.email == "some updated email"
      assert doctor.password_hash == "some updated password_hash"
      assert doctor.username == "some updated username"
    end

    test "update_doctor/2 with invalid data returns error changeset" do
      doctor = doctor_fixture()
      assert {:error, %Ecto.Changeset{}} = Medical_stuff.update_doctor(doctor, @invalid_attrs)
      assert doctor == Medical_stuff.get_doctor!(doctor.id)
    end

    test "delete_doctor/1 deletes the doctor" do
      doctor = doctor_fixture()
      assert {:ok, %Doctor{}} = Medical_stuff.delete_doctor(doctor)
      assert_raise Ecto.NoResultsError, fn -> Medical_stuff.get_doctor!(doctor.id) end
    end

    test "change_doctor/1 returns a doctor changeset" do
      doctor = doctor_fixture()
      assert %Ecto.Changeset{} = Medical_stuff.change_doctor(doctor)
    end
  end
end
