defmodule CustomerTest do
  use ExUnit.Case
  doctest Customer

  test "greets the world" do
    assert Customer.hello() == :world
  end
end
