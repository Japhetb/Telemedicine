defmodule Telemedicine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Telemedicine.Repo,
      # Start the Telemetry supervisor
      TelemedicineWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Telemedicine.PubSub},
      # Start the Endpoint (http/https)
      TelemedicineWeb.Endpoint
      # Start a worker by calling: Telemedicine.Worker.start_link(arg)
      # {Telemedicine.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Telemedicine.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TelemedicineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
