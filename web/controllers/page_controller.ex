defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  plug :assign_message, "Hey you!"

  def index(conn, _params) do
    conn
    # Redirection
    # |> redirect(to: "/redirect_test")
    # |> redirect(to: redirect_test_path(conn, :redirect_test))
    # |> redirect(to: users_path(conn, :index))
    # Flash message
    |> put_flash(:info, "Welcome flash!")
    |> put_flash(:error, "Error Flash.")
    |> render("index.html")
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!"
  end

  defp assign_message(conn, msg) do
    conn
    |> assign(:message, msg)
  end

  def show(conn, _params) do
    page = %{"title": "first element"}

    render conn, "show.json", page: page
  end

  def show_pages(conn, _params) do
    pages = [%{"title": "second element"}, %{"title": "third element"}]

    render conn, "show_pages.json", pages: pages
  end

end


