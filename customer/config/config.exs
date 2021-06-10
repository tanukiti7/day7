import Config

config :customer, Customer.Repo,
  database: "customer_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :customer,
  ecto_repos: [Customer.Repo]
