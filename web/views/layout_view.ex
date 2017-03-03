defmodule PhoenixLudacris.LayoutView do
  use PhoenixLudacris.Web, :view

  def page_title(assigns) do
    PhoenixLudacris.PageTitle.page_title(assigns)
  end
end

defmodule PhoenixLudacris.PageTitle do
  alias PhoenixLudacris.{ PageView, AboutView, ContactView }

  @suffix "Ludacris"

  def page_title(assigns), do: assigns |> get |> put_suffix

  defp put_suffix(nil), do: @suffix
  defp put_suffix(title), do: title <> " - " <> @suffix

  defp get(%{ view_module: AboutView }), do: "About Us"
  defp get(%{ view_module: ContactView }), do: "Contact Us"
  defp get(%{ view_module: PageView }), do: "Home"
  defp get(_), do: nil
end
