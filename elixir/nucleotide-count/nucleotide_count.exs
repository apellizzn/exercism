defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    if valid?(nucleotide) && Enum.all?(strand, fn x -> valid?(x) end) do
      do_count(strand, nucleotide)
    else
      raise ArgumentError
    end
  end

  def valid?(nucleotide) do
    Enum.member?(@nucleotides, nucleotide)
  end

  defp do_count([], nucleotide) do
    0
  end

  defp do_count([head|tail], nucleotide) do
    (if (head == nucleotide), do: 1, else: 0) + do_count(tail, nucleotide)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    %{?A => count(strand, ?A), ?T => count(strand, ?T), ?C => count(strand, ?C), ?G => count(strand, ?G)}
  end
end
