defmodule Notes.Router do
  use Notes.Web, :router

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

  scope "/", Notes do
    pipe_through :browser

    get       "/",      PageController, :index
    resources "/notes", NoteController
  end

  scope "/auth", Notes do
    pipe_through :browser

    get    "/:provider",          AuthController, :request
    get    "/:provider/callback", AuthController, :callback
    post   "/:provider/callback", AuthController, :callback
    delete "/logout",             AuthController, :delete
  end
end
