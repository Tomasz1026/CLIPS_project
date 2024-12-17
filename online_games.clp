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
    (have-you-played-wow No)
=>
    (result "WOW"))

(defrule Dream-Of-Mirror
    (rpgs-genre Fantasy)
    (have-you-played-wow Yes)
=>
    (result "Dream-Of-Mirror"))
