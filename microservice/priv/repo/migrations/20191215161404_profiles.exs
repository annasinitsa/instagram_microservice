defmodule Microservice.Repo.Migrations.Profiles do
  use Ecto.Migration

  def change do
    def change do
      create table(:inst_users) do
        add :user_id, :integer
        add :access_token, :string
        add :inst_id, :integer
        add :profile, :string
      end
  end
end
