defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/users_old/:id", UsersController, :show
    get "/users_old", UsersController, :index
    get "/show", PageController, :show
    get "/show_pages", PageController, :show_pages
    get "/test", PageController, :test
    resources "/users", UserController
    resources "/videos", VideoController
  end

  scope "/", HelloPhoenix do
    get "/redirect_test", PageController, :redirect_test, as: :redirect_test
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end
end
