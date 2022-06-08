defmodule Acuity do
  @moduledoc """
  Documentation for `Acuity`.
  """

  alias Acuity.API

<<<<<<< HEAD
  # Acuity.get_appoinment(%{"max" => 25, "calendarID" => 27238})
  defdelegate get_appoinments(params), to: API
=======
  # Acuity.get_appointments(%{"max" => 25})
  defdelegate get_appointments(params), to: API
>>>>>>> 296c71f (get appointment api)
end
