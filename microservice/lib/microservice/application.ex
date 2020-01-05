defmodule Microservice.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Microservice.Application, []), worker(Kaffe.Consumer, []), 
      Microservice.Repo
    ]

    opts = [strategy: :one_for_one, name: Microservice.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
