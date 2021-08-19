defmodule GithubFinderWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :github_finder

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
