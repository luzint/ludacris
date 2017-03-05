defmodule PhoenixLudacris.UserAthentification do
  use PhoenixLudacris.Web, :model

  schema "userauthentifications" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string, unique: true
    field :email, :string, unique: true
    field :password_digest, :string
    field :age, :integer
    field :is_active, :boolean, default: false
    field :is_admin, :boolean, default: false
    field :is_writer, :boolean, default: false

    timestamps()
  end

  @required_fields ~w(first_name username email password_digest)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
  end
end
