defmodule DynamicFormWeb.InsuranceApplicationLive.FormComponent do
  use DynamicFormWeb, :live_component

  alias DynamicForm.InsuranceApplications

  @impl true
  def update(%{insurance_application: insurance_application} = assigns, socket) do
    changeset = InsuranceApplications.change_insurance_application(insurance_application)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"insurance_application" => insurance_application_params}, socket) do
    changeset =
      socket.assigns.insurance_application
      |> InsuranceApplications.change_insurance_application(insurance_application_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"insurance_application" => insurance_application_params}, socket) do
    save_insurance_application(socket, socket.assigns.action, insurance_application_params)
  end

  defp save_insurance_application(socket, :edit, insurance_application_params) do
    case InsuranceApplications.update_insurance_application(socket.assigns.insurance_application, insurance_application_params) do
      {:ok, _insurance_application} ->
        {:noreply,
         socket
         |> put_flash(:info, "Insurance application updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_insurance_application(socket, :new, insurance_application_params) do
    case InsuranceApplications.create_insurance_application(insurance_application_params) do
      {:ok, _insurance_application} ->
        {:noreply,
         socket
         |> put_flash(:info, "Insurance application created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
