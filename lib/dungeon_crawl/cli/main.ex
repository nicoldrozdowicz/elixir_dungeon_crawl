defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter... If you dare")
    crawl(hero_choice(), DungeonCrawl.Room.all())
  end

  defp welcome_message do
    Shell.cmd("clear")
    Shell.info("-------------------")
    Shell.info("Hello...")
    Shell.info("You just woke up in a Dungeon full of MoNsTeRs")
    Shell.info("You have to escape... ASAP")
    Shell.info("-------------------")
  end

  defp hero_choice do
    hero = DungeonCrawl.CLI.HeroChoice.start()
    %{hero | name: "You"}
  end

  defp crawl(character, rooms) do
    rooms
    |> Enum.random
    |> room_description
    |> DungeonCrawl.CLI.RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  defp room_description(room) do
    Shell.info("\n#{room.description}\n")
    room
  end

  defp trigger_action({room, action}, character) do
    room.trigger.run(character,  action)
  end

  defp handle_action_result({_, :exit}) do
    Shell.info("You've won the game!")
  end
  defp handle_action_result({%{hit_points: hit_points}, _})
    when hit_points == 0 do
    Shell.info("\nYou died. I'm sorry.")
  end
  defp handle_action_result({character, _}) do
    crawl(character, DungeonCrawl.Room.all())
  end
end
