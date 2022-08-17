defmodule Telemedicine.Medical_infoTest do
  use Telemedicine.DataCase

  alias Telemedicine.Medical_info

  describe "essential" do
    alias Telemedicine.Medical_info.Essentials

    import Telemedicine.Medical_infoFixtures

    @invalid_attrs %{heart_beat: nil, patient_id: nil, pressure: nil, temperature: nil}

    test "list_essential/0 returns all essential" do
      essentials = essentials_fixture()
      assert Medical_info.list_essential() == [essentials]
    end

    test "get_essentials!/1 returns the essentials with given id" do
      essentials = essentials_fixture()
      assert Medical_info.get_essentials!(essentials.id) == essentials
    end

    test "create_essentials/1 with valid data creates a essentials" do
      valid_attrs = %{heart_beat: %{}, patient_id: 42, pressure: %{}, temperature: 42}

      assert {:ok, %Essentials{} = essentials} = Medical_info.create_essentials(valid_attrs)
      assert essentials.heart_beat == %{}
      assert essentials.patient_id == 42
      assert essentials.pressure == %{}
      assert essentials.temperature == 42
    end

    test "create_essentials/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Medical_info.create_essentials(@invalid_attrs)
    end

    test "update_essentials/2 with valid data updates the essentials" do
      essentials = essentials_fixture()
      update_attrs = %{heart_beat: %{}, patient_id: 43, pressure: %{}, temperature: 43}

      assert {:ok, %Essentials{} = essentials} = Medical_info.update_essentials(essentials, update_attrs)
      assert essentials.heart_beat == %{}
      assert essentials.patient_id == 43
      assert essentials.pressure == %{}
      assert essentials.temperature == 43
    end

    test "update_essentials/2 with invalid data returns error changeset" do
      essentials = essentials_fixture()
      assert {:error, %Ecto.Changeset{}} = Medical_info.update_essentials(essentials, @invalid_attrs)
      assert essentials == Medical_info.get_essentials!(essentials.id)
    end

    test "delete_essentials/1 deletes the essentials" do
      essentials = essentials_fixture()
      assert {:ok, %Essentials{}} = Medical_info.delete_essentials(essentials)
      assert_raise Ecto.NoResultsError, fn -> Medical_info.get_essentials!(essentials.id) end
    end

    test "change_essentials/1 returns a essentials changeset" do
      essentials = essentials_fixture()
      assert %Ecto.Changeset{} = Medical_info.change_essentials(essentials)
    end
  end
end
