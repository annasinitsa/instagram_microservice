defmodule Microservice.Profile do
    use Ecto.Schema
    import Ecto.Changeset

    @primary_key false

    schema "insta_users" do
        field :user_id, :integer
        field :profile, :string
        field :access_token, :string
        field :inst_id, :integer
    end    

    def changeset(user) do
        user
        |> validate_required([:insta_id, :access_token])
        |> unique_constraint(:insta_id)
    end

end 