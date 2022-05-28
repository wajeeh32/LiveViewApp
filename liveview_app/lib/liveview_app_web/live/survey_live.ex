defmodule LiveviewAppWeb.SurveyLive do
  use LiveviewAppWeb, :live_view

  alias LiveviewApp.Accounts
  alias LiveviewApp.Catalog

  # def render(assigns)do
  #   ~H"""
  #   <h1> Current Survey </h1>
  #   """
  # end

  def mount(_params, %{"user_token" => user_token}, socket) do
    current_user = Accounts.get_user_by_session_token(user_token)

    {:ok,
     socket
     |> assign(:current_user, current_user)
     |> assign(:games, Catalog.list_games_with_user_rating(current_user))
     |> assign(:counter, 0)}
  end

  def handle_event("increment", %{"id" => _id}, socket) do
    {:noreply, assign(socket, :counter, socket.assigns.counter + 2)}
  end

  def handle_info({:created_rating, updated_product, product_index}, socket) do
    {:noreply, handle_rating_created(socket, updated_product, product_index)}
  end

  def handle_rating_created(
        %{assigns: %{products: products}} = socket,
        updated_product,
        product_index
      ) do
    socket
    |> put_flash(:info, "Rating submitted successfully")
    |> assign(
      :products,
      List.replace_at(products, product_index, updated_product)
    )
  end
end
