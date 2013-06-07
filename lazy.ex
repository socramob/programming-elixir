defmodule Lazy do
  def take([]), do: nil
  def take([ head | _tail ]), do: head

  def give(), do: [1 | give]
end

IO.inspect Lazy.take []
IO.inspect Lazy.take [1, 2, 3]

IO.inspect Lazy.take Lazy.give
