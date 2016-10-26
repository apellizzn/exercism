defmodule Garden do
  @students [
          :alice,
          :bob,
          :charlie,
          :david,
          :eve,
          :fred,
          :ginny,
          :harriet,
          :ileana,
          :joseph,
          :kincaid,
          :larry
        ]

  @plants %{
    ?R => :radishes,
    ?C => :clover,
    ?V => :violets,
    ?G => :grass
  }

  @spec info(String.t(), list) :: map
  def info(info_string, student_names) do
    students = Enum.sort(student_names)
    seed = String.to_charlist(String.replace(info_string, "\n", ""))
    Map.new(students, fn student -> {
      student,
      fetch_plants(seed, offset(students, student))
    } end)
  end
  def info(info_string), do: info(info_string, @students)

  defp fetch_plants(seed, offset) do
    case plants(seed, offset) do
        {a,b,c,d} -> {a,b,c,d}
        _ -> {}
    end
  end

  defp plants(seed, offset) do
    first2(seed, offset) ++ last2(seed, offset)
    |> Enum.map(&Map.get(@plants, &1))
    |> List.to_tuple()
  end

  defp first2(seed, offset), do: Enum.slice(seed, offset * 2, 2)
  defp last2(seed, offset) do
    Enum.slice(seed, div(Enum.count(seed), 2) + (2 * offset), 2)
  end

  defp offset(students, name) do
    Enum.find_index(students, fn x -> x == name end)
  end
end
