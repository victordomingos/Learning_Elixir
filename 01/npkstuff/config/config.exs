# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :npkstuff,
  ecto_repos: [Npkstuff.Repo]

# Configures the endpoint
config :npkstuff, NpkstuffWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WPKRS/sWwdaiEZu5+6451pUtSHxi5ddhYywzJfT00h8WTEI08TCh5Z3oj/4b0Zpw",
  render_errors: [view: NpkstuffWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Npkstuff.PubSub,
  live_view: [signing_salt: "QnvXW41q"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
