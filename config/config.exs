# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gql,
  ecto_repos: [Gql.Repo]

# Configures the endpoint
config :gql, GqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "r0/1f4t3z5/ESGYz+UhOLO/fr0NNFVZpscs0VP3SMgZtYLmL9pNEc68NdAUhwljr",
  render_errors: [view: GqlWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gql.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
