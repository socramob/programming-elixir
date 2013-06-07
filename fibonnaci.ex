defmodule Fib do

  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n-1) + fib(n-2)

  def child(element, func, parent) do
    parent <- {self, func.(element) }
  end

  def spawn_children([ first, second ], func) do
    [ spawn(__MODULE__, :child, [first, func, self]), spawn(__MODULE__, :child, [second, func, self])]
  end

  def collect_results([ first_pid, second_pid ]) do
    a = receive do: ( {^first_pid, value} -> value)
    b = receive do: ( {^second_pid, value} -> value)
    a+b
  end

  def pfib(0), do: 0
  def pfib(1), do: 1
  def pfib(n) do
    [ n - 1, n - 2 ] |> spawn_children(fn cand -> pfib cand end) |> collect_results
  end
end

IO.inspect Fib.fib(30)
IO.inspect Fib.pfib(26)
