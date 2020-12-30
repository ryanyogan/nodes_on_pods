import Config

config :api, ApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4SvogK5ZhqXyqSFVfnQyObAdZFDbbscjLeVu8uRbfNIjbkapNM6DNJXu0PRr77ua",
  render_errors: [view: ApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Api.PubSub,
  live_view: [signing_salt: "NRrgL3kU"]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason
