defmodule DungeonCrawl.CLI.RoomActionsChoice do
  alias Mix.Shell.IO, as: Shell
  import DungeonCrawl.CLI.BaseCommands

  def start(room) do
    room_actions = room.actions
    find_action_by_index = &Enum.at(room_actions, &1)

    Shell.info("What's your next move?\n")

    chosen_action =
      room_actions
      |> display_options
      |> generate_question
      |> Shell.prompt
      |> parse_answer
      |> find_action_by_index.()

    Shell.cmd("clear")

    {room, chosen_action}
  end
end
