import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :dynamic_form, DynamicForm.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "dynamic_form_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dynamic_form, DynamicFormWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qmwcW7CWoGkOzbIB3l8v106PQ1RdA6HBnYHThWLNvhfhsyIy+QXpGcd1lSrvZ+u/",
  server: false

# In test we don't send emails.
config :dynamic_form, DynamicForm.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
