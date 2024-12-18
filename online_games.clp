(defrule start
=>
    (show "start"))

(defrule online-game-genre
    (start Next)
=>
    (question "online-game-genre" "genre"))

(defrule ground-flying
    (genre Shooters)
=>
    (question "ground-flying" "ground-flying"))

(defrule large-scale-battles-or-ability
    (ground-flying Flying though space.)
=>
    (question "large-scale-battles-or-ability" "large-scale-battles-or-ability"))

(defrule Battlestar-Galactica
    (large-scale-battles-or-ability Precise control)
=>
    (result "Battlestar-Galactica"))

(defrule Ace-Onlice
    (large-scale-battles-or-ability Big battles)
=>
    (result "Ace-Onlice"))

(defrule military-monsters
    (ground-flying On the ground.)
=>
    (question "military-monsters" "military-monsters"))

(defrule mummies-werewolves
    (military-monsters Monsters)
=>
    (question "mummies-werewolves" "mummies-werewolves"))

(defrule Wolf-Team
    (mummies-werewolves Werewolves)
=>
    (result "Wolf-Team"))

(defrule Missin-Against-Terror
    (mummies-werewolves Mummies)
=>
    (result "Missin-Against-Terror"))

(defrule ww2
    (military-monsters Military)
=>
    (question "ww2" "ww2"))

(defrule World-Of-Tanks
    (ww2 Tank)
=>
    (result "World-Of-Tanks"))

(defrule Lost-Saga
    (ww2 Soldier)
=>
    (result "Lost-Saga"))










(defrule rpgs-genre
    (genre RPGs)
=>
    (question "rpgs-genre" "rpgs-genre"))

(defrule have-you-played-wow
    (rpgs-genre Fantasy)
=>
    (question "have-you-played-wow" "have-you-played-wow"))

(defrule WOW
    (rpgs-genre Fantasy)
    (have-you-played-wow No?! 10 milion players agree: this is the place to start)
=>
    (result "WOW"))

(defrule pick-up-game
    (have-you-played-wow Yes, Been there, done that)
=>
    (question "pick-up-game" "pick-up-game"))

(defrule pick-up-game
    (have-you-played-wow Yes, Been there, done that)
=>
    (question "pick-up-game" "pick-up-game"))

(defrule more-intense-play
    (pick-up-game Casual)
=>
    (question "more-intense-play" "more-intense-play"))

(defrule Shaiya
    (more-intense-play Yes.)
=>
    (result "Shaiya")
)

(defrule more-social-features
    (more-intense-play No thanks.)
=>
    (question "more-social-features" "more-social-features")
)

(defrule Adventure-Quest
    (more-social-features Solo)
=>
    (result "Adventure-Quest")
)

(defrule Dragon-Fable
    (more-social-features Social)
=>
    (result "Dragon-Fable")
)

(defrule digits
    (pick-up-game Involved)
=>
    (question "digits" "digits"))

(defrule Wizard
    (digits 1 or "not sure")
=>
    (result "Wizard"))

(defrule wide-eyed-Anime
    (digits 2 or more)
=>
    (question "wide-eyed-Anime" "wide-eyed-Anime")
)

(defrule large-scale-battles
    (wide-eyed-Anime No.)
=>
    (question "large-scale-battles" "large-scale-battles")
)

(defrule lord-of-the-rings-trilogy
    (large-scale-battles Yes.)
=>
    (question "lord-of-the-rings-trilogy" "lord-of-the-rings-trilogy")
)

(defrule Lord-Of-The-Rings
    (lord-of-the-rings-trilogy Yes.)
=>
    (result "Lord-Of-The-Rings")
)

(defrule strong-quests-pets
    (lord-of-the-rings-trilogy Meh.)
=>
    (question "strong-quests-pets" "strong-quests-pets")
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
    (large-scale-battles Not especially.)
=>
    (question "pvp" "pvp")
)

(defrule close-to-wow
    (pvp Yes.)
=>
    (question "close-to-wow" "close-to-wow"))

(defrule Runes-Of-Magic
    (close-to-wow Yes)
=>
    (result "Runes-Of-Magic"))

(defrule distinctive-features
    (close-to-wow No)
=>
    (question "distinctive-features" "distinctive-features"))

(defrule Crystal-Saga
    (distinctive-features Auto-pilot mode to grind for you.)
=>
    (result "Crystal-Saga"))

(defrule Forsaken-World
    (distinctive-features The chance to become a god.)
=>
    (result "Forsaken-World"))

(defrule Drakensang
    (distinctive-features Hack-n-slash dungeon diving, like Diablo.)
=>
    (result "Drakensang"))

(defrule grand-daddy-of-rpgs
    (pvp No.)
=>
    (question "grand-daddy-of-rpgs" "grand-daddy-of-rpgs"))

(defrule Age-Of-Conan
    (grand-daddy-of-rpgs I want to perfecr the art of crushing my enemies.)
=>
    (result "Age-Of-Conan"))

(defrule old-school
    (grand-daddy-of-rpgs "I love D&D!")
=>
    (question "old-school" "old-school"))

(defrule Dark-Swords
    (old-school Old-school)
=>
    (result "Dark-Swords")
)

(defrule Dungeons-and-Dragons
    (old-school Cutting edge)
=>
    (result "Dungeons-And-Dragons")
)

(defrule magical-servants
    (wide-eyed-Anime Yes.)
=>
    (question "magical-servants" "magical-servants")
)

(defrule making-commitments
    (magical-servants No thanks, that's half the fun.)
=>
    (question "making-commitments" "making-commitments"))

(defrule Dream-Of-Mirror
    (making-commitments Great - I'd like a game with an emphasis on forging friendships and marriages.)
=>
    (result "Dream-Of-Mirror")
)

(defrule Eden-Eternal
    (making-commitments Not so great - I'd like a game where I can switch my class at any time.)
=>
    (result "Eden-Eternal")
)

(defrule Grand-Fantasia
    (magical-servants Yes please!)
=>
    (result "Grand-Fantasia"))

(defrule incredibles-came-out
    (rpgs-genre Superheroes)
=>
    (question "incredibles-came-out" "incredibles-came-out"))

(defrule Dc-Universe
    (incredibles-came-out Yes)
=>
    (result "Dc-Universe")
)

(defrule Superhero-Squad
    (incredibles-came-out No.)
=>
    (result "Superhero")
)

(defrule vampire-hunting
    (rpgs-genre Something completely different)
=>
    (question "vampire-hunting" "vampire-hunting"))

(defrule Bitefight
    (vampire-hunting Yes.)
=>
    (result "Bitefight"))

(defrule Glitch
    (vampire-hunting No.)
=>
    (result "Glitch"))

(defrule ground-based-missions
    (rpgs-genre Science Fiction)
=>
    (question "ground-based-missions" "ground-based-missions")
)

(defrule Star-Trek
    (ground-based-missions Beam me down, Scotty.)
=>
    (result "Star-Trek"))

(defrule easy-to-pick-up
    (ground-based-missions I'll stick with outer space.)
=>
    (question "easy-to-pick-up" "easy-to-pick-up")
)

(defrule Dark-Orbit
    (easy-to-pick-up Easy to get the hang of.)
=>
    (result "Dark-Orbit"))

(defrule Eve-Online
    (easy-to-pick-up The more epic, the better.)
=>
    (result "Eve-Online"))
