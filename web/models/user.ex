defmodule HabitsOne.User do
  use HabitsOne.Web, :model

  alias HabitsOne.Repo
  alias HabitsOne.User

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def get_user(id), do: Repo.get(User, id)

  def changeset(model, params \\ :invalid) do
    model
    |> cast(params, ~w(name email), [])
    |> validate_length(:name, min: 1, max: 20)
    |> validate_length(:email, min: 1, max: 20)
  end

  # Different context if when signing up
  def registration_changeset(model, params) do
    model
    |> changeset(params)
    |> cast(params, ~w(password), [])
    |> validate_required(:name)
    |> validate_length(:password, min: 6, max: 100)
    |> put_pass_hash()
  end

  defp put_pass_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
