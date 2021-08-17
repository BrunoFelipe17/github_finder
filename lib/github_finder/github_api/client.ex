defmodule GithubFinder.GithubAPI.Client do
  use Tesla

  alias GithubFinder.GithubAPI.Parser

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.JSON

  def user_repos(username) do
    "#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    response = Parser.parser(body)

    {:ok, response}
  end

  defp handle_get({:ok, %Tesla.Env{status: 404}}) do
    {:error, GithubFinder.Error.build_user_not_found()}
  end
end
