defmodule Booking.Repo do
  alias Booking.Item

  @items [
    Item.new("Ryan", "Room 1"),
    Item.new("John", "Room 2"),
    Item.new("Rylan", "Room 3")
  ]

  @spec all(Booking.Item) :: [Booking.Item.t(), ...]
  def all(Item), do: @items
end
