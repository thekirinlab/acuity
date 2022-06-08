use Mix.Config

# for testing with real access token
config :acuity,
  user_id: {:system, "ACUITY_USER_ID"},
  api_key: {:system, "ACUITY_API_KEY"}
