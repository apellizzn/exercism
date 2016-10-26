defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    Map.values(input)
    |> List.flatten()
    |> Map.new(
        fn x ->
          {
            String.downcase(x),
            inverse_lookup(input, x)
          }
        end
      )
  end

  defp inverse_lookup(input, value) do
    input
    |> Enum.find(fn {_,values} -> Enum.member?(values, value) end)
    |> elem(0)
  end
end
