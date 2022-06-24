defmodule DynamicFormWeb.InsuranceApplicationLiveTest do
  use DynamicFormWeb.ConnCase

  import Phoenix.LiveViewTest
  import DynamicForm.InsuranceApplicationsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_insurance_application(_) do
    insurance_application = insurance_application_fixture()
    %{insurance_application: insurance_application}
  end

  describe "Index" do
    setup [:create_insurance_application]

    test "lists all insurance_applications", %{conn: conn, insurance_application: insurance_application} do
      {:ok, _index_live, html} = live(conn, Routes.insurance_application_index_path(conn, :index))

      assert html =~ "Listing Insurance applications"
      assert html =~ insurance_application.name
    end

    test "saves new insurance_application", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.insurance_application_index_path(conn, :index))

      assert index_live |> element("a", "New Insurance application") |> render_click() =~
               "New Insurance application"

      assert_patch(index_live, Routes.insurance_application_index_path(conn, :new))

      assert index_live
             |> form("#insurance_application-form", insurance_application: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#insurance_application-form", insurance_application: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.insurance_application_index_path(conn, :index))

      assert html =~ "Insurance application created successfully"
      assert html =~ "some name"
    end

    test "updates insurance_application in listing", %{conn: conn, insurance_application: insurance_application} do
      {:ok, index_live, _html} = live(conn, Routes.insurance_application_index_path(conn, :index))

      assert index_live |> element("#insurance_application-#{insurance_application.id} a", "Edit") |> render_click() =~
               "Edit Insurance application"

      assert_patch(index_live, Routes.insurance_application_index_path(conn, :edit, insurance_application))

      assert index_live
             |> form("#insurance_application-form", insurance_application: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#insurance_application-form", insurance_application: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.insurance_application_index_path(conn, :index))

      assert html =~ "Insurance application updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes insurance_application in listing", %{conn: conn, insurance_application: insurance_application} do
      {:ok, index_live, _html} = live(conn, Routes.insurance_application_index_path(conn, :index))

      assert index_live |> element("#insurance_application-#{insurance_application.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#insurance_application-#{insurance_application.id}")
    end
  end

  describe "Show" do
    setup [:create_insurance_application]

    test "displays insurance_application", %{conn: conn, insurance_application: insurance_application} do
      {:ok, _show_live, html} = live(conn, Routes.insurance_application_show_path(conn, :show, insurance_application))

      assert html =~ "Show Insurance application"
      assert html =~ insurance_application.name
    end

    test "updates insurance_application within modal", %{conn: conn, insurance_application: insurance_application} do
      {:ok, show_live, _html} = live(conn, Routes.insurance_application_show_path(conn, :show, insurance_application))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Insurance application"

      assert_patch(show_live, Routes.insurance_application_show_path(conn, :edit, insurance_application))

      assert show_live
             |> form("#insurance_application-form", insurance_application: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#insurance_application-form", insurance_application: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.insurance_application_show_path(conn, :show, insurance_application))

      assert html =~ "Insurance application updated successfully"
      assert html =~ "some updated name"
    end
  end
end
