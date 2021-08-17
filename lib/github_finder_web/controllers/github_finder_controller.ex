defmodule GithubFinderWeb.FinderController do
  use GithubFinderWeb, :controller

  def index(conn, %{"username" => username}) do
    with {:ok, repos} <- GithubFinder.get_user_repos(username) do
      conn
      |> put_status(200)
      |> render("show.json", repos: repos)
    end
  end
end
