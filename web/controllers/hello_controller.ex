defmodule HabitsOne.HelloController do
  use HabitsOne.Web, :controller

  def world(conn, %{"name" => name}) do

    Repo.insert(%HabitsOne.User{
      name: name, email: "#{name}@yahoo.com", password_hash: "hehe"
    })

    conn
    |> render("world.html", name: name)
  end

  def world(conn, _) do
    conn
    |> put_flash(:info, "Whoa cool.")
    |> put_flash(:error, "Error.")
    |> render("world.html", name: 'SWAGG')
  end
end
