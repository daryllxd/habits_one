defmodule HabitsOne.MovieData do
  import Plug.Conn

  def movie_total(conn, _opts) do
    assign(conn, :movie_total, 3)
  end
end

