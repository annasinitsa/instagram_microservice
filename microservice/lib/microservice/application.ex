defmodule Microservice.Application do
  use Ecto.Repo, otp_app: :microservice

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Microservice.Application, [])
    ]

    opts = [strategy: :one_for_one, name: Microservice.Supervisor]
    Supervisor.start_link(children, opts)
  end


end
