defmodule HelloPhoenix.ErrorViewTest do
  use HelloPhoenix.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  @moduletag :error_view_case

  @tag error_test: "404"
  test "renders 404.html" do
    assert render_to_string(HelloPhoenix.ErrorView, "404.html", []) == """
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to Phoenix!</title>
    <link rel="stylesheet" href="/css/app.css">
  </head>

  <body>
    <div class="container">
      <div class="header">
        <ul class="nav nav-pills pull-right">
          <li><a href="http://www.phoenixframework.org/docs">Get Started</a></li>
        </ul>
        <span class="logo"></span>
      </div>

      <div class="jumbotron">
        <p>Sorry, the page you are looking for does not exist.</p>
      </div>

      <div class="footer">
        <p><a href="http://phoenixframework.org">phoenixframework.org</a></p>
      </div>

    </div> <!-- /container -->
    <script src="/js/app.js"></script>
  </body>
</html>
"""
  end

  @tag error_test: "500"
  test "render 500.html" do
    assert render_to_string(HelloPhoenix.ErrorView, "500.html", []) ==
           "Internal server error"
  end

  @tag error_test: "other"
  test "render any other" do
    assert render_to_string(HelloPhoenix.ErrorView, "505.html", []) ==
           "Internal server error"
  end
end
