defmodule DynamicFormWeb.InsuranceApplicationLive.Index do
  use DynamicFormWeb, :live_view

  alias DynamicForm.InsuranceApplications
  alias DynamicForm.InsuranceApplications.InsuranceApplication

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :insurance_applications, list_insurance_applications())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Insurance application")
    |> assign(:insurance_application, InsuranceApplications.get_insurance_application!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Insurance application")
    |> assign(:insurance_application, %InsuranceApplication{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Insurance applications")
    |> assign(:insurance_application, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    insurance_application = InsuranceApplications.get_insurance_application!(id)
    {:ok, _} = InsuranceApplications.delete_insurance_application(insurance_application)

    {:noreply, assign(socket, :insurance_applications, list_insurance_applications())}
  end

  defp list_insurance_applications do
    InsuranceApplications.list_insurance_applications()
  end
end
