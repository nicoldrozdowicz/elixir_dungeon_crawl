defmodule DungeonCrawl.Enemies do
  alias DungeonCrawl.Character

  def all, do: [
    %Character{
      name: "Student Loans",
      description: "The enemy is STUDENT LOANS... scariest enemy of them all",
      hit_points: 40,
      max_hit_points: 40,
      damage_range: 20..40,
      attack_description: "COMPOUND INTEREST"
    },
    %Character{
      name: "Dating",
      description: "Oh crud - the enemy is DATING - it's substantially more dangerous since the pandemic",
      hit_points: 70,
      max_hit_points: 70,
      damage_range: 20..70,
      attack_description: "INFECTING YOU WITH COVID-19 AND LEAVING YOU ON READ :eye-roll:"
    },
  ]
end
