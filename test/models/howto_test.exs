defmodule PhoenixLudacris.HowtoTest do
  use PhoenixLudacris.ModelCase

  alias PhoenixLudacris.Howto

  @valid_attrs %{body: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Howto.changeset(%Howto{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Howto.changeset(%Howto{}, @invalid_attrs)
    refute changeset.valid?
  end
end
