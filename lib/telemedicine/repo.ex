defmodule Telemedicine.Repo do
  use Ecto.Repo,
    otp_app: :telemedicine,
    adapter: Ecto.Adapters.Postgres
end
