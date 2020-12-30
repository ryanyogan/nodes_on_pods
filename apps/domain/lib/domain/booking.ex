defmodule Booking do
  @moduledoc false
  alias Booking.{Item, Repo}

  @repo Repo

  @spec list_items :: [Booking.Item.t(), ...]
  def list_items do
    @repo.all(Item)
  end
end
