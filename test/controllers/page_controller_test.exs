defmodule PhoenixLudacris.PageControllerTest do
  use PhoenixLudacris.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Home Page"
  end

  test "GET /about", %{conn: conn} do
    conn = get conn, "/about"
    assert html_response(conn, 200) =~ "About"
  end

  test "GET /contact", %{conn: conn} do
    conn = get conn, "/contact"
    assert html_response(conn, 200) =~ "Contact"
  end
end
