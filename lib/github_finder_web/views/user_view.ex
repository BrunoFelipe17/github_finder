defmodule GithubFinderWeb.UserView do
  use GithubFinderWeb, :view

  alias GithubFinder.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "User created",
      token: token,
      user: user
    }
  end

  def render("signin.json", %{token: token}), do: %{token: token}
end
