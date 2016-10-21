defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count([]), do: 0
  def count([_|tail]), do: 1 + count tail

  @spec reverse(list) :: list
  def reverse([]), do: []
  def reverse([head|tail]), do: reverse2(tail, [head])

  defp reverse2([], result), do: result
  defp reverse2([head|tail], result), do: reverse2(tail, [head|result])

  @spec map(list, (any -> any)) :: list
  def map([],_), do: []
  def map([head|tail], f), do: [f.(head)|map(tail, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([],_), do: []
  def filter([head|tail], f) do
    if f.(head) do
      [head|filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head|tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append([], []), do: []
  def append([], list), do: list
  def append([head|tail], b), do: [head|append(tail, b)]

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([[]|tail]), do: concat(tail)
  def concat([[head|tail]|rest]), do: [head|concat([tail|rest])]
end
