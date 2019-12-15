defmodule Microservice.Profile do
    use Ecto.Schema

    schema "insta_users" do
        field :user_id, :integer
        field :username, :string
        field :access_token, :string
        field :inst_id, :integer
        field :user_pic, :string
        field expires_at, :timestamp
        # field :locale, :string
        # field :expiration_token, :string
        # field :created_time, :date
        # field :updated_time, :date
    end    
end 