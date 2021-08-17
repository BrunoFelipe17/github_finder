defmodule GithubFinderWeb.FinderController do
  use GithubFinderWeb, :controller

  def index(conn, _params) do
    conn
    |> put_status(200)
    |> render("show.json")
  end
end
