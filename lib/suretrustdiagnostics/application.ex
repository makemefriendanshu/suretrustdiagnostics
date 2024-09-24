defmodule Suretrustdiagnostics.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SuretrustdiagnosticsWeb.Telemetry,
      # Start the Ecto repository
      Suretrustdiagnostics.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Suretrustdiagnostics.PubSub},
      # Start Finch
      {Finch, name: Suretrustdiagnostics.Finch},
      # Start the Endpoint (http/https)
      SuretrustdiagnosticsWeb.Endpoint
      # Start a worker by calling: Suretrustdiagnostics.Worker.start_link(arg)
      # {Suretrustdiagnostics.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Suretrustdiagnostics.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SuretrustdiagnosticsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
