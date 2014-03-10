defmodule ExTwitter.API.Lists do
  @moduledoc """
  Provides lists API interfaces.
  """

  import ExTwitter.API.Base

  def list_timeline(list, owner, options \\ []) do
    list_timeline([slug: list, owner_screen_name: owner] ++ options)
  end

  def list_timeline(options) do
    request(:get, "1.1/lists/statuses.json", options |> ExTwitter.Parser.parse_request_params)
      |> Enum.map(&ExTwitter.Parser.parse_tweet/1)
  end
end
