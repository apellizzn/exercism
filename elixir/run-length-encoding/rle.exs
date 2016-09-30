defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    charlist = String.codepoints(string)
    compose(0, List.first(charlist), "", charlist)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    number_with_string = ~r/(\d+)([A-Z])/
    space_between = "\\g{1} \\g{2} "
    separated = String.replace(string, number_with_string, space_between)
    list = String.split(String.trim(separated))
    List.last(Tuple.to_list(Enum.map_reduce(Enum.chunk(list, 2), "", fn (x,y) ->
      {x, y <> String.duplicate(List.last(x), String.to_integer(List.first(x)))}
      end
    )))
  end

  defp compose(n, letter, base, [head|tail]) do
    if letter == head do
       compose(n + 1, letter, base, tail)
    else
       compose(1, head, base <> to_string(n) <> letter, tail)
    end
  end

  defp compose(n, letter, base, []), do: base <> to_string(n) <> letter
end
