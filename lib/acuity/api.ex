defmodule Acuity.API do
  @moduledoc """
  Utilities for interacting with the Acuity API v1.1.
  """

  alias Acuity.{Config, Request}

  @api_path "https://acuityscheduling.com/api/v1"

  @type method :: :get | :post | :put | :delete | :patch
  @type headers :: %{String.t() => String.t()} | %{}
  @type body :: iodata() | {:multipart, list()}

  @request_module if Mix.env() == :test, do: Acuity.RequestMock, else: Request

  def get_appointments(params \\ %{}) do
    encoded_query = URI.encode_query(params)

    request("appointments?#{encoded_query}", :get)
  end

  def create_appointment(params \\ %{}) do
    request("appointments", :post, params)
  end

  def update_appointment(id, params \\ %{}) do
    request("appointments/#{id}", :put, params)
  end

  def cancel_appointment(id, params \\ %{}) do
    request("appointments/#{id}/cancel", :put, params)
  end

  def get_appointment(id) do
    request("appointments/#{id}", :get)
  end

  def reschedule_appointment(id, params) do
    request("appointments/#{id}/reschedule", :put, params)
  end

  def get_appointment_types do
    request("appointment-types", :get)
  end

  def get_calendars do
    request("calendars", :get)
  end

  def get_forms do
    request("forms", :get)
  end

  def get_availability_dates(params \\ %{}) do
    encoded_query = URI.encode_query(params)

    request("availability/dates?#{encoded_query}", :get)
  end

  def get_availability_times(params \\ %{}) do
    encoded_query = URI.encode_query(params)

    request("availability/times?#{encoded_query}", :get)
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

    # hackney: [basic_auth: {Config.user_id(), Config.api_key()}],

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
