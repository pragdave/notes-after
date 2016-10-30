defmodule Notes.MustBeLoggedIn do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _options) do
    redirect_unless(conn, get_session(conn, :current_user))
  end

  defp redirect_unless(conn, nil) do
    conn
    |> Phoenix.Controller.put_flash(:error, "Please log in first")
    |> Phoenix.Controller.redirect(to: "/")
    |> halt
  end

  defp redirect_unless(conn, _) do
    conn
  end
end
