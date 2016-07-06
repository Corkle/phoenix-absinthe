defmodule PhoenixAbsinthe.Router do
  use PhoenixAbsinthe.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :graphql do
    plug PhoenixAbsinthe.Context
  end

  scope "/", PhoenixAbsinthe do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

   scope "/api", PhoenixAbsinthe do
     pipe_through :graphql

     forward "/", Absinthe.Plug,
      schema: PhoenixAbsinthe.Schema
   end
end
