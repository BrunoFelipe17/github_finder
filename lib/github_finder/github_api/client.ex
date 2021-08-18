defmodule GithubFinder.GithubAPI.Client do
  use Tesla

  alias GithubFinder.GithubAPI.Parser
  alias GithubFinder.Error

  @baseurl "https://api.github.com/users/"
  plug Tesla.Middleware.JSON

  def user_repos(url \\ @baseurl, username) do
    "#{url}#{username}/repos"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}) do
    response = Parser.parser(body)

    {:ok, response}
  end

  defp handle_get({:ok, %Tesla.Env{status: _status}}) do
    {:error, GithubFinder.Error.build_user_not_found()}
  end

  defp handle_get({:error, reason}), do: {:error, Error.build(:bad_request, reason)}
end
