defmodule RumblWeb.Auth do
  import Plug.Conn
  import Phoenix.Controller
  alias RumblWeb.Router.Helpers, as: Routes

  @spec init(any) :: any
  def init(opts), do: opts

  @spec call(Plug.Conn.t(), any) :: Plug.Conn.t()
  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Rumbl.Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  @spec login(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  @spec logout(Plug.Conn.t()) :: Plug.Conn.t()
  def logout(conn) do
    configure_session(conn, drop: true)
  end

  @spec authenticate_user(Plug.Conn.t(), any) :: Plug.Conn.t()
  def authenticate_user(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access that page")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end

end
