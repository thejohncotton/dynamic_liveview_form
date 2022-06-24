defmodule DynamicForm.Repo do
  use Ecto.Repo,
    otp_app: :dynamic_form,
    adapter: Ecto.Adapters.Postgres
end
