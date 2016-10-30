use Mix.Config

config :notes,
  ecto_repos: [Notes.Repo]

config :ueberauth, Ueberauth,
  providers: [
    github: { Ueberauth.Strategy.Github, [] },
  ]

  config :ueberauth, Ueberauth.Strategy.Github.OAuth,
       client_id: "6544b9d1bc8cd56f2c60",
       client_secret: "546c4f2ea745533985a8cf0af45b2ad1cf336c22"

config :notes, Notes.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n/q5UggzjPM/EPyE/FsnTxj4C+/VAJo322mqOYiQwAHytmVzRh+D/ITHvAW9CdpU",
  render_errors: [view: Notes.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Notes.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
