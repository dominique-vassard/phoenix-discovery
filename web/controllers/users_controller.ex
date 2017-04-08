defmodule HelloPhoenix.UsersController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render(:index)
    # Force specific return
    # |> put_resp_content_type("text/plain")
    # |> send_resp(201, "")
    # 404
    # |> put_status(:not_found)
    # |> render(HelloPhoenix.ErrorView, "404.html")

  end

  def show(conn, %{"id"=> id}) do
    # text conn, "Showing #{id}"
    # json conn, %{"id": id}
    html conn, """
     <html>
       <head>
          <title>Passing an Id</title>
       </head>
       <body>
         <p>You sent in id #{id}</p>
       </body>
     </html>
    """
  end
end