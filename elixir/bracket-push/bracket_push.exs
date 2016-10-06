defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @brackets %{
    ?{ => ?},
    ?[ => ?],
    ?( => ?)
  }

  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    check(String.to_charlist(String.replace(str, ~r/[^\[\{\(\)\]}]/, "")), [])
  end

  defp check([], []), do: true
  defp check([], [_|_]), do: false

  defp check([h|tail], pending) when h == ?{ or h == ?[ or h == ?( do
    check(tail, [Map.get(@brackets, h)] ++ pending)
  end

  defp check([h|tail], pending) when h == ?} or h == ?] or h == ?) do
    if List.first(pending) != h do
      false
    else
      check(tail, List.delete(pending, h))
    end
  end
end
