defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter(candidates, fn c ->
      anagram_match(String.upcase(base), String.upcase(c))
    end)
  end

  defp anagram_match(base, c) do
    String.length(base) == String.length(c)
    and base != c
    and String.to_charlist(base) -- String.to_charlist(c) == []
  end
end
