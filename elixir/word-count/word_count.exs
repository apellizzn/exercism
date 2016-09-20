defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @pattern [" ", "_"]


  @spec count(String.t) :: map
  def count(sentence) do
    keys = words(sentence)
    create_map(Map.new(keys, fn x -> {x, 0} end), keys)
  end

  defp words(sentence) do
    valid  = ~r/[^a-zA-Z\d\s_ö-]/
    no_multispace = ~r/\s+/
    valid_sentence = String.replace(String.downcase(sentence), valid, "")
    String.split(
      String.replace(valid_sentence, no_multispace, " "),
      @pattern
    )
  end

  defp create_map(m, [head|tail]) do
    create_map(Map.update!(m, head, fn h -> h + 1 end), tail)
  end

  defp create_map(m, []) do m end
end
