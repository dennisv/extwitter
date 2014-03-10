defmodule ExTwitter.API.Search do
  @moduledoc """
  Provides search API interfaces.
  """

  import ExTwitter.API.Base

  def search(query, options \\ []) do
    json = request(:get, "1.1/search/tweets.json", [q: query] ++ options |> ExTwitter.Parser.parse_request_params)
    ExTwitter.JSON.get(json, "statuses") |> Enum.map(&ExTwitter.Parser.parse_tweet/1)
  end
end
