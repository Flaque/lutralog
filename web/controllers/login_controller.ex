defmodule Lutra.LoginController do
  use Lutra.Web, :controller

  alias Lutra.User

  def index(conn, _) do
    render conn, "login.html"
  end

  def create(conn, %{"login_path" => %{"username" => user, "password" => pass}}) do
    userModel = Lutra.Repo.one(from u in Lutra.User, where: u.username == ^user, where: u.password == ^pass)
    if userModel != nil do
      render conn, "index.html"
    end
  end

end
