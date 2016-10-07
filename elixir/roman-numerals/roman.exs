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
  defp exit_or_lookup(rest), do: lookup_lt_eq(rest)

  defp lookup_lt_eq(rest) do
    key = Enum.min_by(Map.keys(@digits), &closer_to(rest, &1))
    {Map.get(@digits, key), rest - key}
  end

  defp closer_to(index, x) when x > index, do: index
  defp closer_to(index, x), do: index - x
end
