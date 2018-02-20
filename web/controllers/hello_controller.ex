defmodule HabitsOne.HelloController do
  use HabitsOne.Web, :controller

  def world(conn, %{"name" => name}) do
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
