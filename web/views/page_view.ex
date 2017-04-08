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
end
