defmodule GithubFinder.GitHubAPI.Client do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://api.github.com/users/"
  plug Tesla.Middleware.JSON

  def user_repos(username) do
    "#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200} = response}) do
    {:ok, response}
  end

  defp handle_get({:ok, %Tesla.Env{status: 404}}) do
    {:error, GithubFinder.Error.build_user_not_found()}
  end
end
