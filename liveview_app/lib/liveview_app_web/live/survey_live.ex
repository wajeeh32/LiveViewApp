defmodule LiveviewAppWeb.SurveyLive do
  use LiveviewAppWeb, :live_view

  alias LiveviewApp.Accounts

  # def render(assigns)do
  #   ~H"""
  #   <h1> Current Survey </h1>
  #   """
  # end
  def mount(_params, %{"user_token" => user_token}, socket) do
    current_user = Accounts.get_user_by_session_token(user_token)
    {:ok,
      socket
      |> assign(:current_user, current_user)}
  end
end
