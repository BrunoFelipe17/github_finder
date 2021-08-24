defmodule GithubFinderWeb.Auth.Guardian do
  use Guardian, otp_app: :github_finder

  alias GithubFinder.{Error, User}
  alias GithubFinder.Users.Get, as: GetUser

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def resource_from_claims(%{"sub" => id}) do
    resource = GetUser.by_id(id)
    {:ok, resource}
  end

  def authenticate(%{"id" => id, "password" => password}) do
    with {:ok, %User{password_hash: hash} = user} <- GetUser.by_id(id),
         true <- Pbkdf2.verify_pass(password, hash),
         {:ok, token, _claim} <- encode_and_sign(user, token_type: "refresh", ttl: {10, :minutes}) do
      {:ok, token}
    else
      false -> {:error, Error.build(:unauthorized, "Please verify your credentials")}
      error -> error
    end
  end

  def authenticate(_), do: {:error, Error.build(:bad_request, "Invalid or missing params")}
end
