defmodule PhoenixLudacris.HowtoControllerTest do
  use PhoenixLudacris.ConnCase

  alias PhoenixLudacris.Howto
  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, howto_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing howtos"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, howto_path(conn, :new)
    assert html_response(conn, 200) =~ "New howto"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, howto_path(conn, :create), howto: @valid_attrs
    assert redirected_to(conn) == howto_path(conn, :index)
    assert Repo.get_by(Howto, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, howto_path(conn, :create), howto: @invalid_attrs
    assert html_response(conn, 200) =~ "New howto"
  end

  test "shows chosen resource", %{conn: conn} do
    howto = Repo.insert! %Howto{}
    conn = get conn, howto_path(conn, :show, howto)
    assert html_response(conn, 200) =~ "Show howto"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, howto_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    howto = Repo.insert! %Howto{}
    conn = get conn, howto_path(conn, :edit, howto)
    assert html_response(conn, 200) =~ "Edit howto"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    howto = Repo.insert! %Howto{}
    conn = put conn, howto_path(conn, :update, howto), howto: @valid_attrs
    assert redirected_to(conn) == howto_path(conn, :show, howto)
    assert Repo.get_by(Howto, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    howto = Repo.insert! %Howto{}
    conn = put conn, howto_path(conn, :update, howto), howto: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit howto"
  end

  test "deletes chosen resource", %{conn: conn} do
    howto = Repo.insert! %Howto{}
    conn = delete conn, howto_path(conn, :delete, howto)
    assert redirected_to(conn) == howto_path(conn, :index)
    refute Repo.get(Howto, howto.id)
  end
end
