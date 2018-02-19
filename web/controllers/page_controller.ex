defmodule HabitsOne.PageController do
  use HabitsOne.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
