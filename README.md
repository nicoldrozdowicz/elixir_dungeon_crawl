# Project Summary
This game is based off of an exercise from Learn Functional Programming with Elixir (Ulisses Almeida).

In order to kick off the game, run `mix start` from the project directory and enjoy. Ensure you have Elixir installed on your machine in advance.

Instructions for installing Elixir: https://elixir-lang.org/install.html

# If you're interested in stepping through the code...
This is how I went about building the game :)

1. Defined a Character struct (see `lib/dungeon_crawl/character.ex`, `lib/dungeon_crawl/enemies.ex`, `lib/dungeon_crawl/heroes.ex`)

    I used the struct to create Enemies and Heroes.

2. Implemented the ability to battle (see `lib/dungeon_crawl/battle.ex`)

   A battle is a fight between two characters (enemies and heroes). Those characters perform a series of attacks. The attacks continue until one of the characters has 0 hit points.

3. Defined Rooms, Actions, and Triggers (see `lib/dungeon_crawl/room.ex`, `lib/dungeon_crawl/room/action.ex`, `lib/dungeon_crawl/room/trigger.ex`, `lib/dungeon_crawl/room/triggers/enemy.ex`, `lib/dungeon_crawl/room/triggers/exit.ex`)

    Rooms can have multiple actions but only a single trigger. Actions are the allowed moves a hero can choose from after entering a room. The only action we currently have in the game is moving forward.

    Once a hero selects an action, that action is used to configure the trigger. Given the hero that entered the room and the action that the hero chose, the trigger kicks off the events that will happen next.

    Note that the two triggers in the game, Exit and Enemy, both implement the Trigger behaviour. Elixir behaviours allow you to define an interface that will be shared across modules.

4. Added the ability to pick a hero and the ability to pick an action (see `lib/dungeon_crawl/cli/base_commands.ex`, `lib/dungeon_crawl/cli/hero_choice.ex`, `lib/dungeon_crawl/cli/room_actions_choice.ex`, `lib/dungeon_crawl/display.ex`)

    Picking a hero and picking an action are implemented using the same underlying functions - BaseCommands. In order to seamlessly handle both actions and characters, the BaseCommands take advatage of the Disaply protocol. Protocols are one technique with which you can leverage polymorphism in elixir.

5. Orchestrated the game via a Main script and a Mix Task (see `lib/dungeon_crawl/cli/main.ex`, `lib/mix/tasks/start.ex`)
