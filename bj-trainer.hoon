!:

:: define types
=/  answer  ?(%correct %wrong)
=/  card  ?(%n2 %n3 %n4 %n5 %n6 %n7 %n8 %n9 %n10 %j %q %k %a)
=/  move  ?(%stand %hit %double %split)
=/  hand  ,[lc=card rc=card]
=/  state  ,[hand=hand dealer=card]
=/  action  ,[move=move state=state]

:: declare entry gate
:-  %say
|=  [[* eny=@uvJ *] [my-action=action ~] *]
:-  %noun

:: define entry action
=<
:-  (check-move my-action)
    next-hand=(next-hand)

:: declare main core
|%

:: return a new random table state
++  next-hand
  |.
  ^-  state
  =/  x1  (~(rad og eny) 13)
  =/  x2  (~(rad og x1) 13)
  =/  x3  (~(rad og x2) 13)
  [[(get-card x1) (get-card x2)] (get-card x3)]

:: gets a card term by index
++  get-card
  |=  index=@ud
  ^-  card
  ?:  =(index 0)  %n2
  ?:  =(index 1)  %n3
  ?:  =(index 2)  %n4
  ?:  =(index 3)  %n5
  ?:  =(index 4)  %n6
  ?:  =(index 5)  %n7
  ?:  =(index 6)  %n8
  ?:  =(index 7)  %n9
  ?:  =(index 8)  %n10
  ?:  =(index 9)  %j
  ?:  =(index 10)  %q
  ?:  =(index 11)  %k
  %a

:: returns an answer depending on whether move is optimal
++  check-move
  |=  [my-action=action]
  ^-  answer
  ?:  =(move.my-action (get-good-move state.my-action))
    %correct
    %wrong

:: returns the optimal move
++  get-good-move
  |=  [my-state=state]
  ^-  move
  ?:  (should-stand my-state)  %stand
  ?:  (should-split my-state)  %split
  ?:  (should-double my-state)  %double
  %hit

:: returns %.y if the user should stand given the game state
++  should-stand
  |=  [my-state=state]
  ^-  @f
  =/  my-hand  hand.my-state
  =/  dealer  dealer.my-state
  ?|
    (hand-is-pair-of my-hand %n10)
    (hand-is-pair-of my-hand %j)
    (hand-is-pair-of my-hand %q)
    (hand-is-pair-of my-hand %k)
    &((hand-is-pair-of my-hand %n9) |(=(dealer %n7) =((card-value dealer) 10) =(dealer %a)))
    &((hand-includes my-hand %a) (gte (hand-value my-hand) 19))
    &(!(hand-includes my-hand %a) (gte (hand-value my-hand) 17))
    &(=(dealer %n2) (hand-is my-hand %a %n6))
    &(|(=(dealer %n2) =(dealer %n7) =(dealer %n8)) (hand-is my-hand %a %n7))
    &((lte (card-value dealer) 6) (gte (hand-value my-hand) 13))
    &(|(=(dealer %n4) =(dealer %n5) =(dealer %n6)) =((hand-value my-hand) 12))
  ==

:: returns %.y if the user should split given the game state
++  should-split
  |=  [my-state=state]
  ^-  @f
  =/  my-hand  hand.my-state
  =/  dealer  dealer.my-state
  ?:  !(hand-is-pair my-hand)
    :: can't split if hand isn't a pair
    %.n
    ?|
      (hand-is-pair-of my-hand %a)
      &((hand-is-pair-of my-hand %n9) |((lte (card-value dealer) 6) =(dealer %n8) =(dealer %n9)))
      (hand-is-pair-of my-hand %n8)
      &((hand-is-pair-of my-hand %n7) (lte (card-value dealer) 7))
      &((hand-is-pair-of my-hand %n6) (lte (card-value dealer) 6))
      &((hand-is-pair-of my-hand %n4) |(=(dealer %n5) =(dealer %n6)))
      &((hand-is-pair-of my-hand %n3) (lte (card-value dealer) 7))
      &((hand-is-pair-of my-hand %n2) (lte (card-value dealer) 7))
    ==

:: returns %.y if the user should double-down given the game state
++  should-double
  |=  [my-state=state]
  ^-  @f
  =/  my-hand  hand.my-state
  =/  dealer  dealer.my-state
  ?|
    &((hand-is-pair-of my-hand %n5) (lte (card-value dealer) 9))
    &(=((hand-value my-hand) 11) (lte (card-value dealer) 10))
    &(=((hand-value my-hand) 10) (lte (card-value dealer) 9))
    &(=((hand-value my-hand) 9) (between (card-value dealer) 3 6))
    ?&  (hand-includes my-hand %a)
      ?|
        &((hand-includes my-hand %n7) (between (card-value dealer) 3 6))
        &((hand-includes my-hand %n6) (between (card-value dealer) 3 6))
        &((hand-includes my-hand %n5) (between (card-value dealer) 4 6))
        &((hand-includes my-hand %n4) (between (card-value dealer) 4 6))
        &((hand-includes my-hand %n3) (between (card-value dealer) 5 6))
        &((hand-includes my-hand %n2) (between (card-value dealer) 5 6))
      ==
    ==
  ==

:: returns %.y iff my-hand includes two of my-cards
++  hand-is-pair-of
  |=  [my-hand=hand my-card=card]
  ^-  @f
  &(=(rc.my-hand my-card) =(lc.my-hand my-card))

:: returns %.y iff my-hand includes two of the same card
++  hand-is-pair
  |=  [my-hand=hand]
  ^-  @f
  =(rc.my-hand lc.my-hand)

:: returns %.y iff my-hand includes one of my-cards
++  hand-includes
  |=  [my-hand=hand my-card=card]
  ^-  @f
  |(=(rc.my-hand my-card) =(lc.my-hand my-card))

:: returns %.y iff my-hand includes the two given cards in either order
++  hand-is
  |=  [my-hand=hand card1=card card2=card]
  ^-  @f
  ?|
    &(=(lc.my-hand card1) =(rc.my-hand card2))
    &(=(lc.my-hand card2) =(rc.my-hand card1))
  ==

:: inclusive between, returns %.y if x is n, m, or between n and m
++  between
  |=  [x=@ud n=@ud m=@ud]
  ^-  @f
  ?|
    &((lte x n) (gte x m))
    &((lte x m) (gte x n))
  ==

:: returns the combined value of a hand, taking aces into account
++  hand-value
  |=  [my-hand=hand]
  ^-  @ud
  =/  simple-value  (add (card-value lc.my-hand) (card-value rc.my-hand))
  ?:  &((gth simple-value 21) (hand-includes my-hand %a))
    (sub simple-value 10)
    simple-value

:: returns the simple value of one card, assuming ace is always 11
++  card-value
  |=  [my-card=card]
  ^-  @ud
  ?-  my-card
    %n2  2
    %n3  3
    %n4  4
    %n5  5
    %n6  6
    %n7  7
    %n8  8
    %n9  9
    %n10  10
    %j  10
    %q  10
    %k  10
    %a  11
  ==

--
