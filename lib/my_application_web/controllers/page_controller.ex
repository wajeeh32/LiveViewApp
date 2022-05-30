defmodule MyApplicationWeb.PageController do
  use MyApplicationWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
