defmodule Telemedicine.AccountsTest do
  use Telemedicine.DataCase

  alias Telemedicine.Accounts

  describe "patients" do
    alias Telemedicine.Accounts.Patient

    import Telemedicine.AccountsFixtures

    @invalid_attrs %{
      date_of_birth: nil,
      first_name: nil,
      gender: nil,
      id_birth_cert: nil,
      last_name: nil,
      location: nil,
      profile_image: nil
    }

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Accounts.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Accounts.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      valid_attrs = %{
        date_of_birth: ~U[2022-08-01 10:39:00Z],
        first_name: "some first_name",
        gender: "some gender",
        id_birth_cert: "some id_birth_cert",
        last_name: "some last_name",
        location: "some location",
        profile_image: "some profile_image"
      }

      assert {:ok, %Patient{} = patient} = Accounts.create_patient(valid_attrs)
      assert patient.date_of_birth == ~U[2022-08-01 10:39:00Z]
      assert patient.first_name == "some first_name"
      assert patient.gender == "some gender"
      assert patient.id_birth_cert == "some id_birth_cert"
      assert patient.last_name == "some last_name"
      assert patient.location == "some location"
      assert patient.profile_image == "some profile_image"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()

      update_attrs = %{
        date_of_birth: ~U[2022-08-02 10:39:00Z],
        first_name: "some updated first_name",
        gender: "some updated gender",
        id_birth_cert: "some updated id_birth_cert",
        last_name: "some updated last_name",
        location: "some updated location",
        profile_image: "some updated profile_image"
      }

      assert {:ok, %Patient{} = patient} = Accounts.update_patient(patient, update_attrs)
      assert patient.date_of_birth == ~U[2022-08-02 10:39:00Z]
      assert patient.first_name == "some updated first_name"
      assert patient.gender == "some updated gender"
      assert patient.id_birth_cert == "some updated id_birth_cert"
      assert patient.last_name == "some updated last_name"
      assert patient.location == "some updated location"
      assert patient.profile_image == "some updated profile_image"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_patient(patient, @invalid_attrs)
      assert patient == Accounts.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Accounts.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Accounts.change_patient(patient)
    end
  end
end
