defmodule Acuity.Config do
  @moduledoc """
  Utility that handles interaction with the application's configuration
  """

  @doc """
  In config.exs your implicit or expicit configuration is:
      config :acuity, json_library: Poison # defaults to Jason but can be configured to Poison
  """
  @spec json_library() :: module
  def json_library do
    resolve(:json_library, Jason)
  end

  @doc """
  In config.exs, use a string, a function or a tuple:
      config :acuity, user_id: System.get_env("ACUITY_USER_ID")

  or:
      config :acuity, user_id: {:system, "ACUITY_USER_ID"}

  or:
      config :acuity, user_id: {MyApp.Config, :acuity_user_id, []}
  """
  def user_id do
    resolve(:user_id, System.get_env("ACUITY_USER_ID"))
  end

  @doc """
  In config.exs, use a string, a function or a tuple:
      config :acuity, api_key: System.get_env("ACUITY_API_KEY")

  or:
      config :acuity, api_key: {:system, "ACUITY_API_KEY"}

  or:
      config :acuity, api_key: {MyApp.Config, :acuity_api_key, []}
  """
  def api_key do
    resolve(:api_key, System.get_env("ACUITY_API_KEY"))
  end

  @doc """
  Resolves the given key from the application's configuration returning the
  wrapped expanded value. If the value was a function it get's evaluated, if
  the value is a touple of three elements it gets applied.
  """
  @spec resolve(atom, any) :: any
  def resolve(key, default \\ nil)

  def resolve(key, default) when is_atom(key) do
    Application.get_env(:acuity, key, default)
    |> expand_value()
  end

  def resolve(key, _) do
    raise(
      ArgumentError,
      message: "#{__MODULE__} expected key '#{key}' to be an atom"
    )
  end

  defp expand_value({:system, env})
       when is_binary(env) do
    System.get_env(env)
  end

  defp expand_value({module, function, args})
       when is_atom(function) and is_list(args) do
    apply(module, function, args)
  end

  defp expand_value(value) when is_function(value) do
    value.()
  end

  defp expand_value(value), do: value
end
