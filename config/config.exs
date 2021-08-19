# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :github_finder,
  ecto_repos: [GithubFinder.Repo]

# Configures the endpoint
config :github_finder, GithubFinderWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hagpPCyICCpYpU0heAxGFuMUYeFyTnb5SBMk4ZmgssIe5LYyUsXKo+n6N9gdk+zZ",
  render_errors: [view: GithubFinderWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: GithubFinder.PubSub,
  live_view: [signing_salt: "mjCrmSmS"]

config :github_finder, GithubFinder.Repo, migration_primary_key: [type: :binary_id]

config :github_finder, GithubFinderWeb.Auth.Guardian,
  issuer: "github_finder",
  secret_key: "pFsllxUBls0fcAQfCe76Hmp/IkCzLzafshTa7q6XWvvyy5oZpYpDvFyGxJVK2pcn"

config :github_finder, GithubFinderWeb.Auth.Pipeline,
  module: GithubFinderWeb.Auth.Guardian,
  error_handler: GithubFinderWeb.Auth.ErrorHandler

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
