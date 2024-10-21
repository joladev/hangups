defmodule Hangups.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HangupsWeb.Telemetry,
      Hangups.Repo,
      {DNSCluster, query: Application.get_env(:hangups, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Hangups.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Hangups.Finch},
      # Start a worker by calling: Hangups.Worker.start_link(arg)
      # {Hangups.Worker, arg},
      # Start to serve requests, typically the last entry
      HangupsWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hangups.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HangupsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
