defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do """
    #{String.capitalize(how_many(number - 1))} #{bottles(number - 1)} of beer on the wall, #{how_many(number - 1)} #{bottles(number - 1)} of beer.
    #{next_verse(number)}.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics, do: lyrics(100..1)
  def lyrics(range) do
    range
    |> Enum.map_reduce("", fn x, y -> {x, y <> "\n" <> verse(x)} end)
    |> elem(1)
    |> String.trim_leading
  end

  defp how_many(0), do: "no more"
  defp how_many(n), do: Integer.to_string(n)

  defp bottles(1), do: "bottle"
  defp bottles(n), do: "bottles"

  defp next_verse(1), do: "Go to the store and buy some more, 99 bottles of beer on the wall"
  defp next_verse(2), do: "Take it down and pass it around, no more bottles of beer on the wall"
  defp next_verse(n), do: "Take one down and pass it around, #{how_many(n - 2)} #{bottles(n - 2)} of beer on the wall"

end
