defmodule HabitsOne.UserController do
  use HabitsOne.Web, :controller
  alias HabitsOne.User

  def index(conn, _params) do
    users = Repo.all(User)

    conn
    |> put_flash(:error, "SWAG")
    |> render("index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(User, id)

    conn
    |> put_flash(:error, "Welcome #{first_name(user)}")
    |> render("show.html", user: user)
  end

  defp first_name(user) do
    user.name
  end
end
