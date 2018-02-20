defmodule HabitsOne.UserView do
  use HabitsOne.Web, :view
  alias HabitsOne.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
    |> String.trim
  end
end
