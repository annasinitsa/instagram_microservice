defmodule Microservice.MixProject do
  use Mix.Project

  def project do
    [
      app: :microservice,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Microservice.Application, []},
      applications: [:ecto, :postgrex, :grpc]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}      
      {:ecto, "~> 1.0"}, 
      {:postgrex, ">= 0.0.0"},
      {:httpoison, "~> 1.0"},
      {:poison, "~> 1.0"},
      {:protobuf, "~> 0.6.3"},
      {:grpc, github: "tony612/grpc-elixir"}
    ]
  end
end
