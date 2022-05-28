defmodule LiveviewAppWeb.SampleLive.CounterLive do
  use LiveviewAppWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="hero">I am content: <%= @content %></div>
    """
  end

  def update(assigns, socket) do
    IO.inspect assigns.content, label: "assigns from counter live"

    {:ok,
    socket
    |> assign(:content, assigns.content)}
  end
end
