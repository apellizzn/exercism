defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    List.last(
      Tuple.to_list(
        Enum.map_reduce(
          words(string),
          "",
          fn x, y -> {y, y <> String.upcase(String.at(x, 0)) } end
        )
      )
    )
  end

  defp words(string) do
    replace_dash_with_space = String.replace(string, "-", " ")
    divide_upcase_letters = String.replace(replace_dash_with_space,  ~r/([A-Z])/, " \\g{1}")
    remove_first_space = String.trim(divide_upcase_letters)
    String.split(remove_first_space)
  end
end
