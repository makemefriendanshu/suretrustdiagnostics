defmodule Suretrustdiagnostics.Repo do
  use Ecto.Repo,
    otp_app: :suretrustdiagnostics,
    adapter: Ecto.Adapters.Postgres
end
