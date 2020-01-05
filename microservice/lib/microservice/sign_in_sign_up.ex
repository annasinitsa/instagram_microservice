defmodule Microservice.SignInSignUp do
  import Ecto.Changeset, only: [apply_action: 2, change: 2]
  import Microservice.Repo, only: [get_by: 2]
  #import Microservice.GetProfile, only: [get_profile: 2]
  #import Microservice.Producer, only: [send_message: 2]
 

  @moduledoc """
  Helper functions for sign in / sign up process.
  Used by instagram_microservice to validate user
  access token and fetch profile.
  """
  
  @doc """
    Method update_profile() is used when 
    user had already signed up but the
    access token for the corresponding
    account expired. Fetches profile
    from API Instagram Basic Display if token
    passed by client is valid and updates
    table "insta_users" in profiles DB.
    In the end a message is sent to the 
    TokenTopic and ProfileTopic.
  """
  @spec update_profile(integer(), String.t()) :: {}
  def update_profile(insta_id, access_token) do
  profile = get_profile(inst_id, access_token)
    
    # if output from Graph API was not erroneous
    if profile["error"] == nil do
      # fetch old profile
      old = get_by(Microservice.Profile, inst_id: inst_id)
      # create a struct for a new profile
      new = %{:inst_id      => inst_id,
              :profile      => profile["username"],
              :access_token => access_token
            }
  
      # apply update to the database table
      change(old, new) |> apply_action(:update)
  
      send_message("TokenTopic", {Integer.to_string(insta_id), "1"})
      send_message("UserProfileTopic",
                  {Integer.to_string(inst_id), profile["username"]})
  
    else
      IO.puts("Token is invalid")
      # Token is invalid
        send_message("TokenTopic",
                    {Integer.to_string(insta_id), "0"})
    end
    IO.puts("User with insta_id #{insta_id} updated profile")
  end
  
  
  @doc """
    Method sign_up() is called when there is not entry
    in the "insta_users" table for the user with 
    identifier -- insta_id. Fetches profile and then 
    inserts it into the DB. Finally sends message to
    the TokenTopic and UserProfileTopic. If passed token
    is invalid sends message only to the TokenTopic.
  """
  @spec sign_up(integer(), String.t()) :: {}
  def sign_up(insta_id, access_token) do
    profile = get_profile(insta_id, access_token)
  
    if profile["error"] == nil do
        record = %Microservice.Profile{
                    insta_id: insta_id,
                    user_profile: profile["username"],
                    access_token: access_token}
  
        Microservice.Repo.insert!(record)
          
        IO.puts("User with insta_id #{insta_id} is signed up")
 
        # Share user profile with other services via broker
  
        send_message("UserProfileTopic",
                    {Integer.to_string(insta_id), profile["username"]})
  
    else
        IO.puts("Token is invalid")
        # Token is invalid
        send_message("TokenTopic",
                    {Integer.to_string(insta_id), "0"})
    end
  end
  
  
  @doc """
    Method sign_in() is called when token from the
    profiles DB "insta_users" table matches the
    one passed by client. It means that user tries
    to login short after registration when access 
    token has not expired yet.
  """
  @spec sign_in(integer()) :: {}
  def sign_in(insta_id) do
    # Tell the broker that token is valid
    send_message("TokenTopic", {Integer.to_string(insta_id), "1"})
    IO.puts("User with insta_id #{insta_id} signed in")
  end    
  
end