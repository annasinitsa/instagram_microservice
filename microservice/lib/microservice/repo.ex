defmodule Microservice.Repo do
    use Ecto.Repo,
      otp_app: :microservice,
      adapter: Ecto.Adapters.Postgres
  end
  