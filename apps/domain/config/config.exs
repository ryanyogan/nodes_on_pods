import Config

config :domain, ecto_repos: [Domain.Repo]

config :domain, Domain.Repo,
  username: "eat_user",
  password: "qwerty123",
  database: "eat_db",
  hostname: "database",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
