defmodule Lutra.LoginController do
  use Lutra.Web, :controller

  alias Lutra.User

  def index(conn, _) do
    render conn, "login.html"
  end

  def create(conn, %{"login_path" => %{"username" => user, "password" => pass}}) do
    userModel = Lutra.Repo.one(from u in Lutra.User, where: u.username == ^user, where: u.password == ^pass)
    if userModel do
      conn
        |> put_session(:role, userModel.role)
        |> redirect(to: post_path(conn, :index)) #Go to the post controller
    else
      conn
        |> redirect(to: login_path(conn, :index)) #Just refresh the page
    end
  end

end
