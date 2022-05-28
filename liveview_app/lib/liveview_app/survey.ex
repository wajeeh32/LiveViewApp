defmodule LiveviewApp.Survey do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias LiveviewApp.Repo
  alias LiveviewApp.Survey.Rating

  def change_rating(rating, attrs \\ %{}) do
    Rating.changeset(rating, attrs)
  end

  def list_ratings do
    Repo.all(Rating)
  end

  def get_rating!(id), do: Repo.get!(Rating, id)

  def create_rating(attrs \\ %{}) do
    %Rating{}
    |> Rating.changeset(attrs)
    |> Repo.insert()
  end

  def update_rating(%Rating{} = rating, attrs) do
    rating
    |> Rating.changeset(attrs)
    |> Repo.update()
  end

  def delete_ratings(%Rating{} = ratings) do
    Repo.delete(ratings)
  end
end
