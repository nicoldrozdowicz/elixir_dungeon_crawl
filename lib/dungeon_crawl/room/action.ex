defmodule DungeonCrawl.Room.Action do
  alias DungeonCrawl.Room.Action
  defstruct label: nil, id: nil

  @type t :: %Action{id: atom, label: String.t}

  def forward, do: %Action{id: :forward, label: "Move forward."}
end
