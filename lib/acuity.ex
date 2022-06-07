defmodule Acuity do
  @moduledoc """
  Documentation for `Acuity`.
  """

  alias Acuity.API

  # Acuity.get_appoinment(%{"max" => 25, "calendarID" => 27238})
  defdelegate get_appoinments(params), to: API
end
