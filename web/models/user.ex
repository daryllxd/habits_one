defmodule HabitsOne.User do
  use HabitsOne.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name email), [])
    |> validate_length(:name, min: 1, max: 20)
    |> validate_length(:email, min: 1, max: 20)
  end
end
