defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace(["-", " "], "")
    |> String.to_charlist()
    |> byChar(%{})
    |> Map.values()
    |> Enum.all?(fn x -> x == 1 end)
  end

  def byChar([], chars), do: chars
  def byChar([head|tail], chars) do
    byChar(tail, Map.update(chars, head, 1, fn x -> x + 1 end))
  end
end
