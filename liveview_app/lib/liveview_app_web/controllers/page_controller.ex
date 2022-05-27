defmodule LiveviewAppWeb.PageController do
  use LiveviewAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
