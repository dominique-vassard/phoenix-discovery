defmodule HelloPhoenix.PageView do
  use HelloPhoenix.Web, :view

  def nice_message do
    "Message from there"
  end

  def render("show.json", %{"page": page}) do
    %{data: render_one(page, HelloPhoenix.PageView, "page.json")}
  end

  def render("show_pages.json", %{"pages": pages}) do
    %{data: render_many(pages, HelloPhoenix.PageView, "page.json")}
  end

  def render("page.json", %{"page": page}) do
    %{title: page.title}
  end

  def handler_info(conn) do
    "Request handled by #{controller_module conn}.#{action_name conn}"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end
end
