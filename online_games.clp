(defrule start
=>
    (show "start"))

(defrule online-game-genre
    (start)
=>
    (question "online-game-genre" "genre"))

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

(defrule lord-of-the-rings
    (large-scale-battles Yes.)
=>
    (question "lord-of-the-rings" "lord-of-the-rings")
)

(defrule Lord
    (lord-of-the-rings Yes.)
=>
    (result "Lord")
)

(defrule strong-quests-pets
    (lord-of-the-rings Meh.)
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
    (lord-of-the-rings Not especially.)
=>
    (question "pvp" "pvp")
)

(defrule close-to-wow
    (pvp Yes.)
=>
    (question "close-to-wow" "close-to-wow"))

(defrule Runes-Of-Magic
    (close-to-wow Yes.)
=>
    (result "Runes-Of-Magic"))

(defrule distinctive
    (close-to-wow No)
=>
    (question "distinctive" "distinctive" "distinctive"))

(defrule Crystal-Saga
    (distinctive Auto-pilot mode to grind for you.)
=>
    (result "Crystal-Saga"))

(defrule Forsaken-World
    (distinctive The chance to become a god.)
=>
    (result "Forsaken-World"))

(defrule Drakensang
    (distinctive Hack-n-slash dungeon diving, like Diablo.)
=>
    (result "Drakensang"))

(defrule grand-daddy-of-rpgs
    (pvp No.)
=>
    (question "grand-daddy-of-rpgs" "grand-daddy-of-rpgs"))

(defrule Age-Of-Conan
    (grand-daddy-of-rpgs [1])
=>
    (result "Age-Of-Conan"))

(defrule old-school
    (grand-daddy-of-rpgs [2])
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
    (result "Superhero-Squad")
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
