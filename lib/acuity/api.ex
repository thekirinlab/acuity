defmodule Acuity.API do
  @moduledoc """
  Utilities for interacting with the Crowdin API v2.
  """

  alias Acuity.{Config, Request}

  @api_path "https://acuityscheduling.com/api/v1/"

  @type method :: :get | :post | :put | :delete | :patch
  @type headers :: %{String.t() => String.t()} | %{}
  @type body :: iodata() | {:multipart, list()}

  @request_module if Mix.env() == :test, do: Acuity.RequestMock, else: Request

  def get_appointment(params \\ %{}) do
    request("appointments", :get, params)
  end

  defp api_path do
    @api_path
  end

  @spec add_default_headers(headers) :: headers
  defp add_default_headers(headers) do
    Map.merge(
      %{
        Accept: "application/json; charset=utf8",
        "Content-Type": "application/json"
      },
      headers
    )
  end

  # @spec add_auth_header(headers) :: headers
  # defp add_auth_header(headers) do
  #   Map.put(headers, "Authorization", "Bearer #{Config.access_token()}")
  # end

  @spec request(String.t(), method, body, headers, list) ::
          {:ok, map} | {:error, any()}
  def request(path, method, body \\ "", headers \\ %{}, opts \\ []) do
    req_url = build_path(path)

    opts = [hackney: [basic_auth: {Config.user_id(), Config.api_key()}]]

    req_headers =
      headers
      |> add_default_headers()
      # |> add_auth_header()
      |> Map.to_list()

    encoded_body = encode_body(body, method, req_headers)

    @request_module.request(method, req_url, encoded_body, req_headers, opts)
  end

  defp encode_body(body, method, req_headers) do
    if method != :get && Keyword.get(req_headers, :"Content-Type") == "application/json" do
      Config.json_library().encode!(body)
    else
      body
    end
  end

  defp build_path(path) do
    if String.starts_with?(path, "/") do
      "#{api_path()}#{path}"
    else
      "#{api_path()}/#{path}"
    end
  end
end
