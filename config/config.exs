# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :habits_one,
  ecto_repos: [HabitsOne.Repo]

# Configures the endpoint
config :habits_one, HabitsOne.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m98samAs3qN9ZwNYapd1yqcGqmn7kMeB4zMz6WalfajIiXsCOI82GplkaYwpVJZI",
  render_errors: [view: HabitsOne.ErrorView, accepts: ~w(html json)],
  pubsub: [name: HabitsOne.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
