defmodule HabitsOne.UserController do
  use HabitsOne.Web, :controller

  import HabitsOne.MovieData
  plug :movie_total

  alias HabitsOne.User

  def index(conn, _params) do
    users = Repo.all(User)

    conn
    |> render("index.html", users: users)
  end

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.registration_changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      { :ok, user } ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :index))
      {:error, changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = User.get_user(id)

    case Repo.delete(user) do
      { :ok, user } ->
        conn
        |> put_flash(:info, "#{user.name} deleted!")
        |> redirect(to: user_path(conn, :index))
      { :error, user } ->
        conn
        |> put_flash(:error, "Can't delete.")
        |> redirect(to: user_path(conn, :index))
    end
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
