defmodule Chuckx do
  @moduledoc """
  Get Random Chuck Norris jokes for your entertainment.
  
  A nod to Hasin Haydar's [gochuck](https://github.com/hasinhayder/GoChuck/)
  """
  
  @url "http://api.icndb.com/jokes/"

  @doc """
  Fetch and return random jokes
  """
  def random do
    HTTPoison.get(@url <> "random")
    |> elem(1)
    |> Map.get(:body)
    |> Poison.decode
    |> elem(1)
    |> get_in(["value", "joke"])
  end
end
