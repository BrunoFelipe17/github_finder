defmodule GithubFinder.GithubAPI.Parser do
  def parser(body) do
    body
    |> Enum.map(&parse_repos/1)
  end

  def parse_repos(%{
        "id" => id,
        "name" => name,
        "description" => description,
        "html_url" => html_url,
        "stargazers_count" => stargazers_count
      }) do
    %{
      "id" => id,
      "name" => name,
      "description" => description,
      "html_url" => html_url,
      "stargazers_count" => stargazers_count
    }
  end
end
