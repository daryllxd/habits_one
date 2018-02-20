defmodule HabitsOne.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(HabitsOne.User) do
    [
      %HabitsOne.User{id: "1", name: "Daryll", username: "daryllxd", password: "daryllxd"},
      %HabitsOne.User{id: "1", name: "Jerico", username: "jerico", password: "jerico"},
      %HabitsOne.User{id: "3", name: "Justin", username: "justin", password: "justin"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.filter all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
