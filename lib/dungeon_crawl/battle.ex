defmodule DungeonCrawl.Battle do
  alias DungeonCrawl.Character
  alias Mix.Shell.IO, as: Shell

  def fight(character1 = %{hit_points: hit_points1}, character2 = %{hit_points: hit_points2})
    when hit_points1 == 0 or hit_points2 == 0 do
    Shell.info("You conquered the enemy!")
    {character1, character2}
  end
  def fight(character1, character2) do
    character2_after_damage = attack(character1, character2)
    character1_after_damage = attack(character2_after_damage, character1)
    fight(character1_after_damage, character2_after_damage)
  end

  defp attack(%{hit_points: hit_points1}, character2) when hit_points1 == 0, do: character2
  defp attack(character1, character2) do
    damage = Enum.random(character1.damage_range)
    character2_after_damage = Character.damage(character2, damage)

    character1
      |> attack_message(damage)
      |> Shell.info

    character2_after_damage
      |> recieve_message(damage)
      |> Shell.info

    character2_after_damage
  end

  defp attack_message(character = %{name: "You"}, damage) do
    "You attack with #{character.attack_description} and deal #{damage} damage"
  end
  defp attack_message(character, damage) do
    "#{character.name} attacks with #{character.attack_description} and deals #{damage} damage"
  end

  defp recieve_message(character = %{name: "You"}, damage) do
    "You recieve #{damage}. Current HP: #{character.hit_points}"
  end
  defp recieve_message(character, damage) do
    "#{character.name} recieved #{damage}. Current HP: #{character.hit_points}"
  end
end
