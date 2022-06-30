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
            "formsText" => "Name: John Doe",
            "certificate" => nil,
            "priceSold" => "0.00",
            "location" => "URL: https://app.acuityscheduling.com/schedule.php?owner=21359557&action=meet&apptID=838318342&meetID=9b6d33e6ee0706c83b04d9c68ac48475",
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
  """

  defdelegate get_appointments(params), to: API

  @doc """
  Create an appointment

  ## Examples

     iex> Acuity.create_appointments(%{
        "appointmentTypeID" => 1,
        "datetime" => "2016-04-01T09:00",
        "firstName" => "Bob",
        "lastName" => "McTest",
        "email" => "bob.mctest@example.com"
        })
      {:ok,
          %{
          "id" => 54321,
          "firstName" => "Bob",
          "lastName" => "McTest",
          "phone" => "",
          "email" => "bob.mctest@example.com",
          "date" => "June 17, 2013",
          "time" => "10:15am",
          "endTime" => "11:15am",
          "dateCreated" => "July 2, 2013",
          "datetime" => "2013-06-17T10:15:00-0700",
          "price" => "10.00",
          "paid" => "no",
          "amountPaid" => "0.00",
          "type" => "Regular Visit",
          "appointmentTypeID" => 1,
          "classID" => nil,
          "duration" => "60",
          "calendar" => "My Calendar",
          "calendarID" => 27238,
          "location" => "",
          "certificate" => nil,
          "confirmationPage" => "https://acuityscheduling.com/schedule.php?owner=11145481&id[]=1220aa9f41091c50c0cc659385cfa1d0&action=appt",
          "formsText" => "...",
          "notes" => "Notes",
          "timezone" => "America/New_York",
          "forms" => [
            %{
              "id" => 1,
              "name" => "Example Intake Form",
              "values" => [
                %{
                  "value" => "yes",
                  "name" => "Is this your first visit?",
                  "fieldID" => 1,
                  "id" => 21502993
                },
                %{
                  "value" => "Ninja",
                  "name" => "What is your goal for this appointment?",
                  "fieldID" => 2,
                  "id" => 21502994
                }
              ]
            }
          ],
          "labels" => [
            %{
              "id" => 1,
              "name" => "Completed",
              "color" => "pink"
            }
          ]
        }
  """

  defdelegate create_appointment(params), to: API

  @doc """
  Update an appointment details from a white-list of updatable attributes.

  ## Examples

      iex> Acuity.update_appointment(
        54321,
        %{
            "firstName" => "string",
            "lastName" => "string",
            "email" => "string",
            "phone" => "string",
            "certificate" => "string",
            "notes" => "string",
            "smsOptIn" => false
        })
      {:ok,
                %{
          "id" =>  54321,
          "firstName" =>  "Bob",
          "lastName" =>  "McTest",
          "phone" =>  "",
          "email" =>  "bob.mctest@example.com",
          "date" =>  "June 17, 2013",
          "time" => "10:15am",
          "endTime" => "11:15am",
          "dateCreated" => "July 2, 2013",
          "datetime" => "2013-06-17T10:15:00-0700",
          "price" => "10.00",
          "paid" => "no",
          "amountPaid" => "0.00",
          "type" => "Regular Visit",
          "appointmentTypeID" => 1,
          "classID" => nil,
          "duration" => "60",
          "calendar" => "My Calendar",
          "calendarID" => 27238,
          "canClientCancel" => false,
          "canClientReschedule" => false,
          "location" => "",
          "certificate" => nil,
          "confirmationPage" => "https://acuityscheduling.com/schedule.php?owner=11145481&id[]=1220aa9f41091c50c0cc659385cfa1d0&action=appt",
          "formsText" => "...",
          "notes" => "Notes",
          "timezone" => "America/New_York",
          "scheduledBy" => nil,
          "forms" => [
            %{
              "id" => 1,
              "name" => "Example Intake Form",
              "values" => [
                %{
                  "value" => "yes",
                  "name" => "Is this your first visit?",
                  "fieldID" => 1,
                  "id" => 21502993
                },
                %{
                  "value" => "Ninja",
                  "name" => "What is your goal for this appointment?",
                  "fieldID" => 2,
                  "id" => 21502994
                }
              ]
            }
          ],
          "labels" => [
                %{
                    "id" => 3,
                    "name" => "Completed",
                    "color" => "pink"
                }
            ],
        }
      }
  """

  defdelegate update_appointment(id, params), to: API

  @doc """
  Update an appointment details from a white-list of updatable attributes.

  ## Examples

      iex> Acuity.cancel_appointment(
        54321,
        %{
            "cancelNote" => "The bridge is out!"
        })
      {:ok,
                %{
          "id" =>  54321,
          "firstName" =>  "Bob",
          "lastName" =>  "McTest",
          "phone" =>  "",
          "email" =>  "bob.mctest@example.com",
          "date" =>  "June 17, 2013",
          "time" => "10:15am",
          "endTime" => "11:15am",
          "dateCreated" => "July 2, 2013",
          "datetime" => "2013-06-17T10:15:00-0700",
          "price" => "10.00",
          "paid" => "no",
          "amountPaid" => "0.00",
          "type" => "Regular Visit",
          "appointmentTypeID" => 1,
          "classID" => nil,
          "duration" => "60",
          "calendar" => "My Calendar",
          "calendarID" => 27238,
          "canClientCancel" => false,
          "canClientReschedule" => false,
          "location" => "",
          "certificate" => nil,
          "confirmationPage" => "https://acuityscheduling.com/schedule.php?owner=11145481&id[]=1220aa9f41091c50c0cc659385cfa1d0&action=appt",
          "formsText" => "...",
          "notes" => "Notes",
          "timezone" => "America/New_York",
          "scheduledBy" => nil,
          "forms" => [
            %{
              "id" => 1,
              "name" => "Example Intake Form",
              "values" => [
                %{
                  "value" => "yes",
                  "name" => "Is this your first visit?",
                  "fieldID" => 1,
                  "id" => 21502993
                },
                %{
                  "value" => "Ninja",
                  "name" => "What is your goal for this appointment?",
                  "fieldID" => 2,
                  "id" => 21502994
                }
              ]
            }
          ],
          "labels" => [
                %{
                    "id" => 3,
                    "name" => "Completed",
                    "color" => "pink"
                }
            ],
        }
      }
  """

  defdelegate cancel_appointment(id, params), to: API


  @doc """
  Get a single appointment by ID.

  ## Examples

      iex> Acuity.get_appointment(54321)
      {:ok,
                %{
          "id" =>  54321,
          "firstName" =>  "Bob",
          "lastName" =>  "McTest",
          "phone" =>  "",
          "email" =>  "bob.mctest@example.com",
          "date" =>  "June 17, 2013",
          "time" =>  "10:15am",
          "endTime" =>  "11:15am",
          "dateCreated" =>  "July 2, 2013",
          "datetime" =>  "2013-06-17T10:15:00-0700",
          "price" =>  "10.00",
          "paid" =>  "no",
          "amountPaid" =>  "0.00",
          "type" =>  "Regular Visit",
          "appointmentTypeID" =>  1,
          "classID" =>  nil,
          "duration" =>  "60",
          "calendar" =>  "My Calendar",
          "calendarID" =>  27238,
          "canClientCancel" =>  false,
          "canClientReschedule" =>  false,
          "location" =>  "",
          "certificate" =>  nil,
          "confirmationPage" =>  "https://acuityscheduling.com/schedule.php?owner=11145481&id[]=1220aa9f41091c50c0cc659385cfa1d0&action=appt",
          "formsText" =>  "...",
          "notes" =>  "Notes",
          "timezone" =>  "America/New_York",
          "scheduledBy" =>  nil,
          "forms" =>  [
            %{
              "id" =>  1,
              "name" =>  "Example Intake Form",
              "values" =>  [
                %{
                  "value" =>  "yes",
                  "name" =>  "Is this your first visit?",
                  "fieldID" =>  1,
                  "id" =>  21502993
                },
                %{
                  "value" =>  "Ninja",
                  "name" =>  "What is your goal for this appointment?",
                  "fieldID" =>  2,
                  "id" =>  21502994
                }
              ]
            }
          ],
          "labels" =>  [
                %{
                    "id" =>  3,
                    "name" =>  "Completed",
                    "color" =>  "pink"
                }
            ],
        }
      }
  """

  defdelegate get_appointment(id), to: API

  @doc """
  Reschedule an appointment.

  ## Examples

      iex> Acuity.reschedule_appointment(1, %{
         "datetime" => "2016-04-01T09:00",
         "calendarID => 1
      })
      {:ok,
        {
          "id" => 1,
          "firstName" => "Bob",
          "lastName" => "McTest",
          "phone" => "",
          "email" => "bob.mctest@example.com",
          "date" => "June 17, 2013",
          "time" => "10:15am",
          "endTime" => "11:15am",
          "dateCreated" => "July 2, 2013",
          "datetime" => "2016-02-03T14:00:00-0800",
          "price" => "10.00",
          "paid" => "no",
          "amountPaid" => "0.00",
          "type" => "Regular Visit",
          "appointmentTypeID" => 1,
          "classID" => nil,
          "duration" => "60",
          "calendar" => "My Calendar",
          "calendarID" => 1,
          "location" => "",
          "certificate" => nil,
          "confirmationPage" => "https://acuityscheduling.com/schedule.php?owner=11145481&id[]=1220aa9f41091c50c0cc659385cfa1d0&action=appt",
          "formsText" => "...",
          "notes" => "Notes",
          "timezone" => "America/New_York",
          "forms" => [
            {
              "id" => 1,
              "name" => "Example Intake Form",
              "values" => [
                {
                  "value" => "yes",
                  "name" => "Is this your first visit?",
                  "fieldID" => 1,
                  "id" => 21502993
                },
                {
                  "value" => "Ninja",
                  "name" => "What is your goal for this appointment?",
                  "fieldID" => 2,
                  "id" => 21502994
                }
              ]
            }
          ]
        }
  """
  defdelegate reschedule_appointment(id, params), to: API

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
            "description" => "Expertise: Individual, Career, Relationship and Family Concernsnguage: English, Malay, Tamiluntry: Malaysiacation (F2F Services): Klang",
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

  @doc """
  Get all forms

  ## Examples

      iex> Acuity.get_forms()
        {:ok,
          [
            %{
              "appointmentTypeIDs" => [53733086, 21825761],
              "description" => "This form will take you about 10-15 minutes to complete, so that we can prepare the best service for you.",
              "fields" => [
                %{
                  "id" => 10113708,
                  "lines" => 1,
                  "name" => "Name of Partner",
                  "options" => nil,
                  "required" => true,
                  "type" => "textbox"
                },
                %{
                  "id" => 10113719,
                  "name" => "Your Gender",
                  "options" => ["Male", "Female", "Prefer not to say"],
                  "required" => true,
                  "type" => "dropdown"
                },
                %{
                  "id" => 10113834,
                  "name" => "Address",
                  "options" => nil,
                  "required" => true,
                  "type" => "address"
                },
                %{
                  "id" => 10113729,
                  "name" => "Preferred Language of session",
                  "options" => ["English", "Malay", "Mandarin", "Tamil"],
                  "required" => true,
                  "type" => "checkboxlist"
                },
                %{
                  "id" => 10113836,
                  "name" => "Have you and your partner received prior couples counseling related to any of the above problems?",
                  "options" => nil,
                  "required" => true,
                  "type" => "yesno"
                }
              ],
              "hidden" => false,
              "id" => 0681823,
              "name" => "Couples Counseling Registration and Intake Form (Full version)"
            }
          ]
        }
  """
  defdelegate get_forms, to: API

  @doc """
  Get all avaibility dates

  ## Examples

      iex> Acuity.get_availability_dates(%{"month" => "2022-06", "appointmentTypeID" => 34144102})
        {:ok,
          [
            %{"date" => "2022-06-20"},
            %{"date" => "2022-06-22"},
            %{"date" => "2022-06-27"}
          ]
        }
  """

  defdelegate get_availability_dates(params), to: API

  @doc """
  Get all avaibility times

  ## Examples

      iex> Acuity.get_availability_times(%{"date" => "2022-06-20", "appointmentTypeID" => 34144102})
        {:ok,
          [
            %{
              "time" => "2022-06=20T13:00:00-0800"
            },
            %{
              "time" => "2022-06=20T14:00:00-0800"
            },
            %{
              "time" => "2022-06=20T15:00:00-0800"
            }
          ]
        }
  """
  defdelegate get_availability_times(params), to: API
end
