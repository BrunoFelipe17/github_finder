defmodule GithubFinderWeb.UserController do
  use GithubFinderWeb, :controller

  alias GithubFinder.User
  alias GithubFinderWeb.{Auth.Guardian}

  def create(conn, params) do
    with {:ok, %User{} = user} <- GithubFinder.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:created)
      |> render("create.json", token: token, user: user)
    end
  end
end
