defmodule DynamicForm.InsuranceApplications.InsuranceApplication do
  use Ecto.Schema
  import Ecto.Changeset

  schema "insurance_applications" do
    field :name, :string
    field :agreement, :boolean

    timestamps()
  end

  @doc false
  def changeset(insurance_application, attrs) do
    insurance_application
    |> cast(attrs, [:name, :agreement])
    |> validate_required([:name])
  end
end
