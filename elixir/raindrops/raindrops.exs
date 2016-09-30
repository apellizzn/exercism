defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """

  @rain [
    "Plong": 7 ,
    "Plang": 5 ,
    "Pling": 3
  ]

  @blank ""

  @spec convert(pos_integer) :: String.t
  def convert(number) do
    rain = to_rain(number)
    if rain == @blank do
      to_string number
    else
      rain
    end
  end

  @spec to_rain(pos_integer) :: String.t
  defp to_rain(number) do
    @rain
    |> Enum.reduce(@blank, fn
      ({drop, n}, str) when n <= number and rem(number, n) == 0 ->
         to_string(drop) <> str
      (_, str) ->
        str
    end)
  end
end
