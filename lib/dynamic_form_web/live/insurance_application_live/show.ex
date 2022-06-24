defmodule DynamicFormWeb.InsuranceApplicationLive.Show do
  use DynamicFormWeb, :live_view

  alias DynamicForm.InsuranceApplications

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:insurance_application, InsuranceApplications.get_insurance_application!(id))}
  end

  defp page_title(:show), do: "Show Insurance application"
  defp page_title(:edit), do: "Edit Insurance application"
end
