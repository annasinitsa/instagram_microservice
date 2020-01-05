defmodule Microservice do
  import Ecto.Query, only: [from: 2]
  import Microservice.SignInSignUp, only: [sign_in: 1,
                                            sign_up: 3,
                                            update_profile: 3]
  @moduledoc """
  Documentation for Microservice.
  """

  @spec instagram_microservice(integer(), String.t(), String.t()) :: {} 
  def instagram_microservice(insta_id, input_token, access_token) do

    query = from u in "insta_users",
            where: u.insta_id == ^insta_id,
            select: u.access_token

    token_from_db = Microservice.Repo.all(query) |> List.first()

    cond do
      token_from_db == nil -> 
        sign_up(insta_id, input_token, access_token)

      token_from_db != access_token -> 
        update_profile(insta_id, input_token, access_token)

      token_from_db == access_token -> 
        sign_in(insta_id)
    end
  end
end