defmodule GetProfile do
    import HTTPoison, only: [get: 1]

    @endpoint "https://graph.instagram.com"
    @spec get_profile(integer(), String.t()) :: {String.t()}

    def get_profile(id, access_token) do
        url_user = @endpoint <> "/#{id}?access_token=#{access_token}"

        profile = elem(get(url_user), 1).body() |> Poison.decode() |> elem(1)

        profile
    end

end
