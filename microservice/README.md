# Microservice

Project outline:
1. Create Elixir app using the following command
  mix new microservice --sup
2. Add dependencies to mix.exs file.
3. Create infrastructure for database using Ecto
  3.1. Generate ropository: mix ecto.gen.repo -r Microservice.Repo
  3.2. Add configuration file: set host, database, password and user to connect to DB
  3.3 Set Microservice.Repo as a supervisor
  3.4 Create DB: mix ecto.create
  3.5. Create migration for the DB: mix ecto.gen.migration Profile
  3.6. Create shcema 
4. Set up gRPC communication
  4.1. Define certificates
    4.1.1. Get https://github.com/square/certstrap
  4.2. Create functionality for server and client
## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `microservice` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:microservice, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/microservice](https://hexdocs.pm/microservice).

