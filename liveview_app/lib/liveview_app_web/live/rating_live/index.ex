defmodule LiveviewAppWeb.RatingLive.Index do
  use Phoenix.Component
  use Phoenix.HTML
  alias LiveviewAppWeb.RatingLive

  def games(assigns) do
    ~H"""
    <div class="survey-component-container">
      <.heading games={@games} />
      <.list games={@games} current_user={@current_user}/>
    </div>
    """
  end

  def heading(assigns) do
    ~H"""
      <h2>
        Ratings
        <%= if ratings_complete?(@games), do: raw "&#x2713;" %>
      </h2>
    """
  end

  defp ratings_complete?(games) do
    Enum.all?(games, fn game ->
      length(game.ratings) == 1
    end)
  end

  def list(assigns) do
    ~H"""
    <%= for {game, index} <- Enum.with_index(@games) do %>
      <%= if rating = List.first(game.ratings) do %>
        <LiveviewAppWeb.RatingLive.Show.stars rating={rating} game={game} />
      <% else %>
        <.live_component module={RatingLive.Form}
                          id={"rating-form-#{game.id}"}
                          game={game}
                          game_index={index}
                          current_user={@current_user } />
      <% end %>
    <% end %>
    """
  end
end
