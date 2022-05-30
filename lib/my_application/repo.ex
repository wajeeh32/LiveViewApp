defmodule MyApplication.Repo do
  use Ecto.Repo,
    otp_app: :my_application,
    adapter: Ecto.Adapters.Postgres
end
