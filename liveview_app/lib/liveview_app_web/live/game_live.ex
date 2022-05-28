defmodule LiveviewAppWeb.GameLive do
  use LiveviewAppWeb, :live_view

  def mount(_params, %{"user_token" => _user_token}, socket) do
    {:ok,
     socket
     |> assign(:games, LiveviewApp.Catalog.list_games())}
  end

  def handle_event("Add", %{"game" => name}, socket) do
    LiveviewApp.Catalog.create_game(name)
    {:noreply, assign(socket, games: LiveviewApp.Catalog.list_games())}
  end

  def handle_event("Delete", %{"id" => id}, socket) do
    LiveviewApp.Catalog.get_game!(id)
    |> LiveviewApp.Catalog.delete_game()

    {:noreply, assign(socket, games: LiveviewApp.Catalog.list_games())}
  end
end
