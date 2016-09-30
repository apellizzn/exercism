defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  @type comparison :: :equal | :unequal | :sublist | :superlist

  def compare(a, b) do
    case { Enum.count(a), Enum.count(b) }  do
      {x, y} when x > y -> superlist?(a, b, y)
      {x, y} when x < y -> sublist?(b, a, x)
      _ -> if a === b, do: :equal, else: :unequal
    end
  end

  defp continue(a, b, f, y) do
    if Enum.count(a) == Enum.count(b) do
      :unequal
    else
      f.(Enum.drop(a, 1), b, y)
    end
  end

  defp sublist?(a, b, y) do
    case compare(Enum.take(a, y), b) do
      :equal -> :sublist
      :unequal -> continue(a,b, &(sublist?/3), y)
    end
  end

  defp superlist?(a, b, y) do
    case compare(Enum.take(a, y), b) do
      :equal -> :superlist
      :unequal ->continue(a,b, &(superlist?/3), y)
    end
  end
end
