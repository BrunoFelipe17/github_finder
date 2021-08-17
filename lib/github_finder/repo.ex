defmodule GithubFinder.Repo do
  use Ecto.Repo,
    otp_app: :github_finder,
    adapter: Ecto.Adapters.Postgres
end
