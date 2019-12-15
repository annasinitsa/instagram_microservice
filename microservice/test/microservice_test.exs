defmodule MicroserviceTest do
  use ExUnit.Case
  doctest Microservice

  test "greets the world" do
    assert Microservice.hello() == :world
  end
end
