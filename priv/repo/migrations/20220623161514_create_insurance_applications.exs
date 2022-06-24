defmodule DynamicForm.Repo.Migrations.CreateInsuranceApplications do
  use Ecto.Migration

  def change do
    create table(:insurance_applications) do
      add :name, :string
      add :agreement, :boolean

      timestamps()
    end
  end
end
