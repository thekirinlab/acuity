defmodule Acuity do
  @moduledoc """
  Documentation for Acuity Scheduling v1.1
  API reference can be found here: https://developers.acuityscheduling.com/reference

  """

  alias Acuity.API

  @doc """
  Get appointments

  ## Examples

      iex> Acuity.get_appointments(%{"max" => 25})
      {:ok,
        {:ok,
          [
          %{
            "timezone" => "Asia/Manila",
            "id" => 183428383,
            "endTime" => "3:00pm",
            "forms" => [
              %{
                "id" => 2322025,
                "name" => "",
                "values" => [
                  %{
                    "fieldID" => 11281125,
                    "id" => 3367788034,
                    "name" => "Are you still using our App? ",
                    "value" => "no"
                  },
                  %{
                    "fieldID" => 11281126,
                    "id" => 3367788035,
                    "name" => "If yes, what is your email address used to register for the App?",
                    "value" => ""
                  }
                ]
              }
            ],
            "calendarTimezone" => "Asia/Manila",
            "category" => "Online Service",
            "subCalendarID" => 2878624,
            "type" => "Returning Clients (PHP1200)",
            "duration" => "60",
            "datetime" => "2022-06-28T14:00:00+0800",
            "formsText" => "Name: John Doe\nPhone: 1234432432\nEmail: test@example.com\n\nLocation\n============\nURL: https://app.acuityscheduling.com/schedule.php?owner=:owner_id&action=meet&apptID=:apptid&meetID=:meet_id\n\n\n\n============\nAre you still using our ThoughtFullChat App? : no\n\nIf yes, what is your email address used to register for ThoughtFullChat App?: \n\nIf yes, what is the name of your ThoughtFull Professional?: Phoebe Bernardo\n\n\n\nTHOUGHTFULLCHAT TELEPSYCHOLOGY INFORMED CONSENT FORM\n============\nI hereby acknowledge that I have read, understand and consent to the terms of telepsychology services set forth above.: yes\n\n\n\nCancellation/ Rescheduling Policy\n============\nI have read and agreed to the cancellation policy.: yes\n\n",
            "certificate" => nil,
            "priceSold" => "0.00",
            "location" => "URL: https://app.acuityscheduling.com/schedule.php?owner=21359557&action=meet&apptID=838318342&meetID=9b6d33e6ee0706c83b04d9c68ac48475 \n",
            "amountPaid" => "0.00",
            "calendarID" => 6224198,
            "phone" => "+16265871714",
            "lastName" => "Doe",
            "firstName" => "John",
            "price" => "0.00",
            "classID" => nil,
            "canClientReschedule" => true,
            "notes" => "",
            "appointmentTypeID" => 26937488,
            "dateCreated" => "June 6, 2022",
            "canClientCancel" => true,
            "paid" => "no",
            "email" => "test@gmail.com",
            "datetimeCreated" => "2022-06-05T21:16:50-0500",
            "time" => "2:00pm",
            "date" => "June 28, 2022",
            "canceled" => false,
            "calendar" => "Jane Doe",
            "confirmationPage" => "https://app.acuityscheduling.com/schedule.php?owner=:ownder_id&action=appt&id%5B%5D=:appt_id",
            "addonIDs" => [],
            "labels" => nil
          }
        ]
      }
    }
  """

  defdelegate get_appointments(params), to: API

  @doc """
  Get all appointment types

  ## Examples

      iex> Acuity.get_appointment_types()
      {:ok,
        [
          %{
            "active" => true,
            "addonIDs" => [],
            "calendarIDs" => [562031],
            "category" => "Ask Me Anything",
            "classSize" => nil,
            "color" => "#6FCF97",
            "description" => "Prices listed above do not apply for this session.",
            "duration" => 30,
            "formIDs" => [1918022, 3239160],
            "id" => 95712350,
            "image" => "",
            "name" => "Ask Me Anything Virtual Booths",
            "paddingAfter" => 0,
            "paddingBefore" => 0,
            "price" => "0.00",
            "private" => true,
            "schedulingUrl" => "https://app.acuityscheduling.com/schedule.php?owner=:owner_id&appointmentType=:appointmentType",
            "type" => "service"
          }
        ]
      }
  """
  #
  defdelegate get_appointment_types, to: API

  @doc """
  Get all calendars

  ## Examples

      iex> Acuity.get_calendars()
      {:ok,
        [
          %{
            "description" => "Expertise: Individual, Career, Relationship and Family Concerns\nLanguage: English, Malay, Tamil\n\nCountry: Malaysia\nLocation (F2F Services): Klang",
            "email" => "test@example.com, therapy@example.com",
            "id" => 1481526,
            "image" => "//cdn-s.acuityscheduling.com/test.jpg?8142016179",
            "location" => "",
            "name" => "John Doe",
            "replyTo" => "coach@example.com",
            "thumbnail" => "//cdn-s.acuityscheduling.com/test-thubm.jpg?8142016179",
            "timezone" => "Asia/Kuala_Lumpur"
          },
        ]
      }
  """
  defdelegate get_calendars, to: API
end
