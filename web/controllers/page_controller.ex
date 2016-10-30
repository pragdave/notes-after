defmodule Notes.PageController do
  use Notes.Web, :controller

  def index(conn, _params) do
    render(conn,
           "index.html",
           current_user: get_session(conn, :current_user))
  end
end
