(defrule start
=>
    (show "start"))

(defrule online-game-genre
    (start Next)
=>
    (question "online-game-genre" Shooters RPGs Strategy "Virtual Worlds"))

(defrule ground-flying
    (online-game-genre Shooters)
=>
    (question "ground-flying" "Flying though space" "On the ground"))

(defrule large-scale-battles-or-ability
    (ground-flying Flying though space)
=>
    (question "large-scale-battles-or-ability" "Precise control" "Big battles"))

(defrule Battlestar-Galactica
    (large-scale-battles-or-ability Precise control)
=>
    (result "Battlestar Galactica"))

(defrule Ace-Onlice
    (large-scale-battles-or-ability Big battles)
=>
    (result "Ace Onlice"))

(defrule military-monsters
    (ground-flying On the ground)
=>
    (question "military-monsters" Monsters Military))

(defrule mummies-werewolves
    (military-monsters Monsters)
=>
    (question "mummies-werewolves" Werewolves Mummies))

(defrule Wolf-Team
    (mummies-werewolves Werewolves)
=>
    (result "Wolf Team"))

(defrule Mission-Against-Terror
    (mummies-werewolves Mummies)
=>
    (result "Mission Against Terror"))

(defrule ww2
    (military-monsters Military)
=>
    (question "ww2" Tank Soldier))

(defrule World-Of-Tanks
    (ww2 Tank)
=>
    (result "World Of Tanks"))

(defrule Lost-Saga
    (ww2 Soldier)
=>
    (result "Lost Saga"))

(defrule rpgs-genre
    (online-game-genre RPGs)
=>
    (question "rpgs-genre" Fantasy "Science Fiction" Superheroes "Something completely different"))

(defrule have-you-played-wow
    (rpgs-genre Fantasy)
=>
    (question "have-you-played-wow" "Yes, Been there, done that" "No?! 10 milion players agree: this is the place to start"))

(defrule WOW
    (rpgs-genre Fantasy)
    (have-you-played-wow No?! 10 milion players agree: this is the place to start)
=>
    (result "World Of Warcraft"))

(defrule pick-up-game
    (have-you-played-wow Yes, Been there, done that)
=>
    (question "pick-up-game" Casual Involved))

(defrule more-intense-play
    (pick-up-game Casual)
=>
    (question "more-intense-play" Yes "No thanks"))

(defrule Shaiya
    (more-intense-play Yes)
=>
    (result "Shaiya")
)

(defrule more-social-features
    (more-intense-play No thanks)
=>
    (question "more-social-features" Solo Social)
)

(defrule Adventure-Quest
    (more-social-features Solo)
=>
    (result "Adventure Quest Worlds")
)

(defrule Dragon-Fable
    (more-social-features Social)
=>
    (result "Dragon Fable")
)

(defrule digits
    (pick-up-game Involved)
=>
    (question "digits" "1 or not sure" "2 or more"))

(defrule Wizard
    (digits 1 or not sure)
=>
    (result "Wizard 101"))

(defrule wide-eyed-Anime
    (digits 2 or more)
=>
    (question "wide-eyed-Anime" Yes No)
)

(defrule large-scale-battles
    (wide-eyed-Anime No)
=>
    (question "large-scale-battles" Yes "Not especially")
)

(defrule lord-of-the-rings-trilogy
    (large-scale-battles Yes)
=>
    (question "lord-of-the-rings-trilogy" Yes Meh)
)

(defrule Lord-Of-The-Rings
    (lord-of-the-rings-trilogy Yes)
=>
    (result "Lord Of The Rings Online")
)

(defrule strong-quests-pets
    (lord-of-the-rings-trilogy Meh)
=>
    (question "strong-quests-pets" Quests Pets)
)

(defrule 4Story
    (strong-quests-pets Quests)
=>
    (result "4Story")
)

(defrule Aika
    (strong-quests-pets Pets)
=>
    (result "Aika")
)

(defrule pvp
    (large-scale-battles Not especially)
=>
    (question "pvp" Yes No)
)

(defrule close-to-wow
    (pvp Yes)
=>
    (question "close-to-wow" Yes No))

(defrule Runes-Of-Magic
    (close-to-wow Yes)
=>
    (result "Runes Of Magic"))

(defrule distinctive-features
    (close-to-wow No)
=>
    (question "distinctive-features" "Auto-pilot mode to grind for you" "The chance to become a god" "Hack-n-slash dungeon diving, like Diablo"))

(defrule Crystal-Saga
    (distinctive-features Auto-pilot mode to grind for you)
=>
    (result "Crystal Saga"))

(defrule Forsaken-World
    (distinctive-features The chance to become a god)
=>
    (result "Forsaken World"))

(defrule Drakensang
    (distinctive-features Hack-n-slash dungeon diving, like Diablo)
=>
    (result "Drakensang"))

(defrule grand-daddy-of-rpgs
    (pvp No)
=>
    (question "grand-daddy-of-rpgs" "I want to perfecr the art of crushing my enemies" "I love D#38D"))

(defrule Age-Of-Conan
    (grand-daddy-of-rpgs I want to perfecr the art of crushing my enemies)
=>
    (result "Age Of Conan"))

(defrule old-school
    (grand-daddy-of-rpgs I love D#38D)
=>
    (question "old-school" Old-school "Cutting edge"))

(defrule Dark-Swords
    (old-school Old-school)
=>
    (result "Dark Swords")
)

(defrule Dungeons-and-Dragons
    (old-school Cutting edge)
=>
    (result "Dungeons And Dragons Online")
)

(defrule magical-servants
    (wide-eyed-Anime Yes)
=>
    (question "magical-servants" "No thanks, that's half the fun" "Yes please")
)

(defrule making-commitments
    (magical-servants No thanks, that's half the fun)
=>
    (question "making-commitments" "Great - I'd like a game with an emphasis on forging friendships and marriages" "Not so great - I'd like a game where I can switch my class at any time"))

(defrule Dream-Of-Mirror
    (making-commitments Great - I'd like a game with an emphasis on forging friendships and marriages)
=>
    (result "Dream Of Mirror")
)

(defrule Eden-Eternal
    (making-commitments Not so great - I'd like a game where I can switch my class at any time)
=>
    (result "Eden Eternal")
)

(defrule Grand-Fantasia
    (magical-servants Yes please)
=>
    (result "Grand Fantasia"))

(defrule incredibles-came-out
    (rpgs-genre Superheroes)
=>
    (question "incredibles-came-out" Yes No))

(defrule Dc-Universe
    (incredibles-came-out Yes)
=>
    (result "DC Universe Online")
)

(defrule Superhero-Squad
    (incredibles-came-out No)
=>
    (result "Superhero Squad Online")
)

(defrule vampire-hunting
    (rpgs-genre Something completely different)
=>
    (question "vampire-hunting" Yes No))

(defrule Bitefight
    (vampire-hunting Yes)
=>
    (result "Bitefight"))

(defrule Glitch
    (vampire-hunting No)
=>
    (result "Glitch"))

(defrule ground-based-missions
    (rpgs-genre Science Fiction)
=>
    (question "ground-based-missions" "Beam me down, Scotty" "I'll stick with outer space")
)

(defrule Star-Trek
    (ground-based-missions Beam me down, Scotty)
=>
    (result "Star Trek Online"))

(defrule easy-to-pick-up
    (ground-based-missions I'll stick with outer space)
=>
    (question "easy-to-pick-up" "Easy to get the hang of" "The more epic, the better")
)

(defrule Dark-Orbit
    (easy-to-pick-up Easy to get the hang of)
=>
    (result "Dark Orbit"))

(defrule Eve-Online
    (easy-to-pick-up The more epic, the better)
=>
    (result "Eve Online"))

(defrule the-family
    (online-game-genre Strategy)
=>
    (question "the-family" Fantasy Historical Mafia))

(defrule Godfather-Five-Families
    (the-family Mafia)
=>
    (result "Godfather: Five Families"))

(defrule rpg-elements
    (the-family Fantasy)
=>
    (question "rpg-elements" "RPG elements" "Just stategy, please"))

(defrule Call-Of-Gods
    (rpg-elements RPG elements)
=>
    (result "Call Of Gods"))

(defrule Grepolis
    (rpg-elements Just stategy, please)
=>
    (result "Grepolis"))

(defrule casual-game-more-involved
    (the-family Historical)
=>
    (question "casual-game-more-involved" Involved Casual))

(defrule solo-or-forming-alliances
    (casual-game-more-involved Involved)
=>
    (question "solo-or-forming-alliances" "It's all me" "You can't conquer the worls without friends"))

(defrule Castle-Empire
    (solo-or-forming-alliances It's all me)
=>
    (result "Castle Empire"))

(defrule Travian
    (solo-or-forming-alliances You can't conquer the worls without friends)
=>
    (result "Travian"))

(defrule higher-level-strategic
    (casual-game-more-involved Casual)
=>
    (question "higher-level-strategic" "Real time Tactics" "Strategic control"))

(defrule 1100-Ad
    (higher-level-strategic Real time Tactics)
=>
    (result "1100 AD"))

(defrule Tribal-Wars
    (higher-level-strategic Strategic control)
=>
    (result "Tribal Wars"))

(defrule built-in-or-freedom
    (online-game-genre Virtual Worlds)
=>
    (question "built-in-or-freedom" "Built in games" "An open-ended world")
)

(defrule blocks-or-legos
    (built-in-or-freedom Built in games)
=>
    (question "blocks-or-legos" Blocks Legos)
)

(defrule Minecraft-Classic
    (blocks-or-legos Blocks)
=>
    (result "Minecraft Classic")
)

(defrule Roblox
    (blocks-or-legos Legos)
=>
    (result Roblox)
)

(defrule chat-or-create 
    (built-in-or-freedom An open-ended world)
=>
    (question "chat-or-create" Chat Create)
)

(defrule IMVU
    (chat-or-create Chat)
=>
    (result IMVU)
)

(defrule Second-Life
    (chat-or-create Create)
=>
    (result "Second Life")
)
