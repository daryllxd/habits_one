defmodule HabitsOne.Auth do
  import Plug.Conn

  def init(opts) do
    # Ruby-style bang method
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && repo.get(HabitsOne.User, user_id)
    assign(conn, :current_user, user)
  end
end
