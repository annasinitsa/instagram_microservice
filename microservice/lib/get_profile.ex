defmodule GetProfile do
    use HTTPoison.Base#, Microservice.Repo, Microservice.FbUser

    @endpoint "https://graph.instagram.com"

    def get_profile(id, access_token) do
        url = @endpoint <> "/#{id}?access_token=#{access_token}"
        #url = @endpoint <> "/17841401625420732?access_token=IGQVJVSFJrb1hUcTZA2cGRDRDJ1djd4WlpIY21SZA053QmNEOWdtcDFjTURVM2RXUW52akdPTGI2VHd6TmJqZA21INGNQNGNqWWphTVotVHZA5RmNZAdjFlZAHptZAzJ6QWlxNDM4SkhicFJSX2ktVWFyMHB0YXgtbFkxVm1ZAVVdz"
        profile = elem(GetProfile.get(url), 1).body() 
        record = %Microservice.Profile{profile: profile, access_token: access_token}
        Microservice.Application.insert!(record)
        # Use Poison.decode to convert BitString to a map.
    end
end
