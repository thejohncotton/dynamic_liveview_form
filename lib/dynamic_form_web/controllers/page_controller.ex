defmodule DynamicFormWeb.PageController do
  use DynamicFormWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
