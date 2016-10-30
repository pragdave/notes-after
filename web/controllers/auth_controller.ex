defmodule Notes.AuthController do
  @moduledoc """
  Auth controller responsible for handling Ueberauth responses
  """

  use Notes.Web, :controller
  plug Ueberauth

  alias Ueberauth.Strategy.Helpers

  # def request(conn, _params) do
  #   raise Helpers.callback_url(conn)
  #   render(conn, "request.html", callback_url: Helpers.callback_url(conn))
  # end

  def delete(conn, _params) do
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: "/")
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    current_user = %{
      name:   auth.info.name  || auth.info.nickname,
      avatar: auth.info.image || auth.info.urls.avatar_url,
      id:     auth.uid
    }

    conn
    |> put_flash(:info, "Successfully authenticated.")
    |> put_session(:current_user, current_user)
    |> redirect(to: "/")
  end
end
