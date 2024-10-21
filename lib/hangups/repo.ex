defmodule Hangups.Repo do
  use Ecto.Repo,
    otp_app: :hangups,
    adapter: Ecto.Adapters.Postgres
end
