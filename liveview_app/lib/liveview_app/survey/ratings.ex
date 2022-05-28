defmodule LiveviewApp.Survey.Rating do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ratings" do
    field :rating, :integer

    belongs_to :user, LiveviewApp.Accounts.User
    belongs_to :game, LiveviewApp.Catalog.Game

    timestamps()
  end

  def changeset(rating, attrs, _opts \\ []) do
    rating
    |> cast(attrs, [:rating, :user_id, :game_id])
    |> validate_required([:rating, :user_id, :game_id])
  end
end
