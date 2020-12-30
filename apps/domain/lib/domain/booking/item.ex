defmodule Booking.Item do
  @moduledoc false
  defstruct ~w(id person place)a

  def new(person, place) do
    %__MODULE__{
      id: random_string(32),
      person: person,
      place: place
    }
  end

  defp random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64()
    |> binary_part(0, length)
  end
end
