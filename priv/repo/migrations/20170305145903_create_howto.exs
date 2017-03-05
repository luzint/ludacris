defmodule PhoenixLudacris.Repo.Migrations.CreateHowto do
  use Ecto.Migration

  def change do
    create table(:howtos) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
