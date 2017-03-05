defmodule PhoenixLudacris.Repo.Migrations.CreateUserAthentification do
  use Ecto.Migration

  def change do
    create table(:userauthentifications) do
      add :first_name, :string
      add :last_name, :string
      add :email, :string
      add :password_digest, :string
      add :age, :integer
      add :is_admin, :boolean, default: false, null: false
      add :is_writer, :boolean, default: false, null: false

      timestamps()
    end

  end
end
