defmodule DynamicForm.InsuranceApplicationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DynamicForm.InsuranceApplications` context.
  """

  @doc """
  Generate a insurance_application.
  """
  def insurance_application_fixture(attrs \\ %{}) do
    {:ok, insurance_application} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> DynamicForm.InsuranceApplications.create_insurance_application()

    insurance_application
  end
end
