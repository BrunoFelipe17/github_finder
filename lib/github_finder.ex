defmodule GithubFinder do
  alias GithubFinder.GithubAPI.Client, as: GetRepos

  @moduledoc """
  GithubFinder keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defdelegate get_user_repos(username), to: GetRepos, as: :user_repos
end
