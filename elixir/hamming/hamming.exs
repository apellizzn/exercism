defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    case {Enum.count(strand1), Enum.count(strand2)} do
        {x, y} when x != y -> {:error, "Lists must be the same length"}
        _ -> {:ok, distance(strand1, strand2)}
    end
  end

  defp distance([], []), do: 0
  defp distance([h|t], [h2|t2]) when h != h2, do: 1 + distance(t, t2)
  defp distance([_|t], [_|t2]), do: distance(t, t2)
end
