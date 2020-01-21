defmodule BlogWeb.Router do
  use BlogWeb, :router
  use Pow.Phoenix.Router

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

  scope "/" do
    pipe_through :browser

    pow_routes()
  end

  scope "/", BlogWeb do
    pipe_through [:browser, :protected]

    # Add your protected routes here
  end

    scope "/", BlogWeb do
      pipe_through :browser
      get "/hello", HelloController, :index
      get "/", PageController, :index

      resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogWeb do
  #   pipe_through :api
  # end
end
