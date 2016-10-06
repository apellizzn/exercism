defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(0), do: raise "error"
  def nth(count) do
    Stream.interval(1)
    |> Stream.drop(2)
    |> Stream.filter(&is_prime?/1)
    |> Enum.take(count)
    |> List.last
  end

  defp is_prime?(n) do
    (2..n |> Enum.filter(fn x -> rem(n, x) == 0 end) |> length()) == 1
  end

end
