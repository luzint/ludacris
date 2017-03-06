defmodule PhoenixLudacris.Repo.Migrations.AddFieldsToAuth do
  use Ecto.Migration
  def change do
      alter table(:userauthentifications) do
        add :password, :string, virtual: true
        add :password_confirmation, :string, virtual: true
      end
  end
end
