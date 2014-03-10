defmodule ExTwitter.API.FriendsAndFollowers do
  @moduledoc """
  Provides friends and followers API interfaces.
  """

  import ExTwitter.API.Base

  def followers(options) when is_list(options) do
    json = request(:get, "1.1/followers/list.json", options |> ExTwitter.Parser.parse_request_params)
    json |> ExTwitter.JSON.get("users") |> Enum.map(&ExTwitter.Parser.parse_user/1)
  end

  def followers(screen_name, options \\ []) do
    followers([screen_name: screen_name] ++ options)
  end
end
