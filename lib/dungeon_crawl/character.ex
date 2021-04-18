defmodule DungeonCrawl.Character do
  defstruct name: nil,
            description: nil,
            hit_points: 0,
            max_hit_points: 0,
            attack_description: nil,
            damage_range: nil

  @type t :: %DungeonCrawl.Character{
    name: String.t,
    description: String.t,
    hit_points: non_neg_integer,
    max_hit_points: non_neg_integer,
    attack_description: String.t,
    damage_range: Range.t
  }

  def damage(character, damage) do
    new_hit_points = max(0, character.hit_points - damage)
    %{character | hit_points: new_hit_points}
  end

  def heal(character, healing) do
    new_hit_points = min(character.max_hit_points, character.hit_points + healing)
    %{character | hit_points: new_hit_points}
  end

  def stats(character) do
    "HP: #{character.hit_points}"
  end
end
