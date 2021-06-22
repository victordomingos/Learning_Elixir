defmodule Npkstuff.Repo do
  use Ecto.Repo,
    otp_app: :npkstuff,
    adapter: Ecto.Adapters.Postgres
end
