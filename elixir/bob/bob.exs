defmodule Bob do
  def hey(input) do
    cond do
        question?(input) -> "Sure."
        yell?(input) -> "Whoa, chill out!"
        nothing?(input) -> "Fine. Be that way!"
        true -> "Whatever."
    end
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end


  defp yell?(input) do
    String.upcase(input) == input && String.match?(input, ~r/\p{L}/)
  end

  defp nothing?(input) do
    String.trim(input) == ""
  end

end
