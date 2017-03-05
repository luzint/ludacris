defmodule PhoenixLudacris.UserAthentificationTest do
  use PhoenixLudacris.ModelCase

  alias PhoenixLudacris.UserAthentification

  @valid_attrs %{age: 42, email: "some content", first_name: "some content", is_admin: true, is_writer: true, last_name: "some content", password_digest: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserAthentification.changeset(%UserAthentification{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserAthentification.changeset(%UserAthentification{}, @invalid_attrs)
    refute changeset.valid?
  end
end
