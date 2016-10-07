defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @digits %{
     1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
       90 => "XC",
       50 => "L",
       40 => "XL",
       10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I"
  }

  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    Stream.unfold(number, &exit_or_lookup/1)
    |> Enum.to_list()
    |> List.to_string()
  end

  defp exit_or_lookup(0), do: nil
  defp exit_or_lookup(index), do: lookup_lt_eq(index)

  defp lookup_lt_eq(index) do
    key = Enum.min_by(Map.keys(@digits), &diffrence_from(index, &1))
    {Map.get(@digits, key), index - key}
  end

  defp diffrence_from(index, x) when x > index, do: index
  defp diffrence_from(index, x), do: index - x
end
