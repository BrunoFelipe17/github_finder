defmodule GithubFinderWeb.Auth.Guardian do
  use Guardian, otp_app: :github_finder

  alias GithubFinder.User
  alias GithubFinder.Users.Get, as: GetUser

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}) do
    resource = GetUser.by_id(id)
    {:ok, resource}
  end
end
