defmodule GithubFinderWeb.FinderView do
  use GithubFinderWeb, :view

  def render("show.json", %{repos: repos}), do: repos
end
