use Mix.Config

config :microservice, Microservice.Application,
  adapter: Ecto.Adapters.Postgres,
  database: "postgres",
  username: "instaserv",
  password: "fr4r45ggdb",
  hostname: "localhost"

config :microservice, ecto_repos: [Mcroservice.Application]

config :grpc, start_server: true