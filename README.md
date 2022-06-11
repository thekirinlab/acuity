# Acuity

Elixir client for Acuity Scheduling API v1.1
API reference can be found [here](https://developers.acuityscheduling.com/reference)

# Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `acuity` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:acuity, "~> 0.1.3"}
  ]
end
```

# Examples
## Get all appointment type example
```
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
```

## Get all calendars
```
      iex> Acuity.get_calendars()
      {:ok,
        [
          %{
            "description" => "Expertise: Individual, Career, Relationship and Family Concerns",
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
```

## Get appointments example
```
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
          "location" => "URL: https://app.acuityscheduling.com/schedule.php?",
          "amountPaid" => "0.00",
          "calendarID" => 6224198,
          "phone" => "+87171416265",
          "lastName" => "Doe",
          "firstName" => "John",
          "price" => "0.00",
          "classID" => nil,
          "canClientReschedule" => true,
          "notes" => "",
          "appointmentTypeID" => 88269374,
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
```

## Get all forms
```
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
```
