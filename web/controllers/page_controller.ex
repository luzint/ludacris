defmodule PhoenixLudacris.PageController do
  use PhoenixLudacris.Web, :controller


  def index(conn, _params) do
    render conn, "index.html", current_user: get_session(conn, :current_user)
  end

  def about(conn, _params) do
    render conn, "about.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end
end
