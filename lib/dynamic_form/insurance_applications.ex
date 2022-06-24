defmodule DynamicForm.InsuranceApplications do
  @moduledoc """
  The InsuranceApplications context.
  """

  import Ecto.Query, warn: false
  alias DynamicForm.Repo

  alias DynamicForm.InsuranceApplications.InsuranceApplication

  @doc """
  Returns the list of insurance_applications.

  ## Examples

      iex> list_insurance_applications()
      [%InsuranceApplication{}, ...]

  """
  def list_insurance_applications do
    Repo.all(InsuranceApplication)
  end

  @doc """
  Gets a single insurance_application.

  Raises `Ecto.NoResultsError` if the Insurance application does not exist.

  ## Examples

      iex> get_insurance_application!(123)
      %InsuranceApplication{}

      iex> get_insurance_application!(456)
      ** (Ecto.NoResultsError)

  """
  def get_insurance_application!(id), do: Repo.get!(InsuranceApplication, id)

  @doc """
  Creates a insurance_application.

  ## Examples

      iex> create_insurance_application(%{field: value})
      {:ok, %InsuranceApplication{}}

      iex> create_insurance_application(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_insurance_application(attrs \\ %{}) do
    %InsuranceApplication{}
    |> InsuranceApplication.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a insurance_application.

  ## Examples

      iex> update_insurance_application(insurance_application, %{field: new_value})
      {:ok, %InsuranceApplication{}}

      iex> update_insurance_application(insurance_application, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_insurance_application(%InsuranceApplication{} = insurance_application, attrs) do
    insurance_application
    |> InsuranceApplication.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a insurance_application.

  ## Examples

      iex> delete_insurance_application(insurance_application)
      {:ok, %InsuranceApplication{}}

      iex> delete_insurance_application(insurance_application)
      {:error, %Ecto.Changeset{}}

  """
  def delete_insurance_application(%InsuranceApplication{} = insurance_application) do
    Repo.delete(insurance_application)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking insurance_application changes.

  ## Examples

      iex> change_insurance_application(insurance_application)
      %Ecto.Changeset{data: %InsuranceApplication{}}

  """
  def change_insurance_application(%InsuranceApplication{} = insurance_application, attrs \\ %{}) do
    InsuranceApplication.changeset(insurance_application, attrs)
  end
end
