defmodule PhoenixLudacris.HowtoController do
  use PhoenixLudacris.Web, :controller

  alias PhoenixLudacris.Howto

  def index(conn, _params) do
    howtos = Repo.all(Howto)
    render(conn, "index.html", howtos: howtos)
  end

  def new(conn, _params) do
    changeset = Howto.changeset(%Howto{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"howto" => howto_params}) do
    changeset = Howto.changeset(%Howto{}, howto_params)

    case Repo.insert(changeset) do
      {:ok, _howto} ->
        conn
        |> put_flash(:info, "Howto created successfully.")
        |> redirect(to: howto_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    howto = Repo.get!(Howto, id)
    render(conn, "show.html", howto: howto)
  end

  def edit(conn, %{"id" => id}) do
    howto = Repo.get!(Howto, id)
    changeset = Howto.changeset(howto)
    render(conn, "edit.html", howto: howto, changeset: changeset)
  end

  def update(conn, %{"id" => id, "howto" => howto_params}) do
    howto = Repo.get!(Howto, id)
    changeset = Howto.changeset(howto, howto_params)

    case Repo.update(changeset) do
      {:ok, howto} ->
        conn
        |> put_flash(:info, "Howto updated successfully.")
        |> redirect(to: howto_path(conn, :show, howto))
      {:error, changeset} ->
        render(conn, "edit.html", howto: howto, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    howto = Repo.get!(Howto, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(howto)

    conn
    |> put_flash(:info, "Howto deleted successfully.")
    |> redirect(to: howto_path(conn, :index))
  end
end
