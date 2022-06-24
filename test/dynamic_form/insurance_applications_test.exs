defmodule DynamicForm.InsuranceApplicationsTest do
  use DynamicForm.DataCase

  alias DynamicForm.InsuranceApplications

  describe "insurance_applications" do
    alias DynamicForm.InsuranceApplications.InsuranceApplication

    import DynamicForm.InsuranceApplicationsFixtures

    @invalid_attrs %{name: nil}

    test "list_insurance_applications/0 returns all insurance_applications" do
      insurance_application = insurance_application_fixture()
      assert InsuranceApplications.list_insurance_applications() == [insurance_application]
    end

    test "get_insurance_application!/1 returns the insurance_application with given id" do
      insurance_application = insurance_application_fixture()
      assert InsuranceApplications.get_insurance_application!(insurance_application.id) == insurance_application
    end

    test "create_insurance_application/1 with valid data creates a insurance_application" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %InsuranceApplication{} = insurance_application} = InsuranceApplications.create_insurance_application(valid_attrs)
      assert insurance_application.name == "some name"
    end

    test "create_insurance_application/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = InsuranceApplications.create_insurance_application(@invalid_attrs)
    end

    test "update_insurance_application/2 with valid data updates the insurance_application" do
      insurance_application = insurance_application_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %InsuranceApplication{} = insurance_application} = InsuranceApplications.update_insurance_application(insurance_application, update_attrs)
      assert insurance_application.name == "some updated name"
    end

    test "update_insurance_application/2 with invalid data returns error changeset" do
      insurance_application = insurance_application_fixture()
      assert {:error, %Ecto.Changeset{}} = InsuranceApplications.update_insurance_application(insurance_application, @invalid_attrs)
      assert insurance_application == InsuranceApplications.get_insurance_application!(insurance_application.id)
    end

    test "delete_insurance_application/1 deletes the insurance_application" do
      insurance_application = insurance_application_fixture()
      assert {:ok, %InsuranceApplication{}} = InsuranceApplications.delete_insurance_application(insurance_application)
      assert_raise Ecto.NoResultsError, fn -> InsuranceApplications.get_insurance_application!(insurance_application.id) end
    end

    test "change_insurance_application/1 returns a insurance_application changeset" do
      insurance_application = insurance_application_fixture()
      assert %Ecto.Changeset{} = InsuranceApplications.change_insurance_application(insurance_application)
    end
  end
end
