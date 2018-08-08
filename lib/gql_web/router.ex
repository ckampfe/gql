defmodule GqlWeb.Router do
  use GqlWeb, :router

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

  scope "/", GqlWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api" do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: GqlWeb.Schema

    forward "/", Absinthe.Plug,
      schema: GqlWeb.Schema
  end
end
