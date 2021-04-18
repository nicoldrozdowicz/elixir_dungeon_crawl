defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  def all, do: [
    %Character{
      name: "Nicol",
      description: "Nicol is BRILLIANT. You should hire her.",
      hit_points: 100,
      max_hit_points: 100,
      damage_range: 10..20,
      attack_description: "DASHING GOOD LOOKS"
    },
    %Character{
      name: "Dakota",
      description: "Dakota is an australian shepherd, but she was the runt of her litter.",
      hit_points: 50,
      max_hit_points: 50,
      damage_range: 1..50,
      attack_description: "PUPPY DOG EYES"
    }
  ]
end
