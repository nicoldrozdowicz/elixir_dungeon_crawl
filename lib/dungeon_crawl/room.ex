defmodule DungeonCrawl.Room do
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct description: nil, actions: [], trigger: nil
  def all, do: [
    %Room{
      description: "Hold on... That's the exit! YOU FOUND THE EXIT!",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You can see an emeny blocking your path!",
      actions: [forward()],
      trigger: Triggers.Enemy
    },
    %Room{
      description: "uh oh... There's an enemy. Hope you're ready to fight.",
      actions: [forward()],
      trigger: Triggers.Enemy
    },
    %Room{
      description: "A wild enemy appeared!",
      actions: [forward()],
      trigger: Triggers.Enemy
    },
  ]
end
