defmodule RumblWeb.SessionController do
  use RumblWeb, :controller
  alias Rumbl.Accounts
  alias RumblWeb.Auth

  @spec new(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def new(conn, _params) do
    render(conn, "new.html")
  end

  @spec create(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def create(conn, %{"session" => %{"username" => username, "password" => pass}} ) do
    case Accounts.authenticate_by_username_and_pass(username, pass) do
      {:ok, user} ->
        conn
        |> Auth.login(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
 	  end
  end

  @spec delete(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def delete(conn, _params) do
    json(conn, %{ok: true})
  end

end
