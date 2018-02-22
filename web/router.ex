defmodule HabitsOne.Router do
  use HabitsOne.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HabitsOne do
    pipe_through :browser # Use the default browser stack

    get "/hello/", HelloController, :world
    get "/hello/:name", HelloController, :world

    resources "/users", UserController, only: [:index, :show, :new, :create, :delete]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", HabitsOne do
  #   pipe_through :api
  # end
end
