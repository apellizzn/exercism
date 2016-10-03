defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    case  Enum.min(factors) do
      min when min > limit -> 0
      min ->
        (min..limit - 1)
        |> Enum.filter(fn x -> Enum.any?(factors, &(divide?(x, &1))) end)
        |> Enum.sum
    end
  end

  defp divide?(x, f) do
    rem(x, f) == 0
  end
end
