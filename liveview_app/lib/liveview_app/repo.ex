defmodule LiveviewApp.Repo do
  use Ecto.Repo,
    otp_app: :liveview_app,
    adapter: Ecto.Adapters.Postgres
end
