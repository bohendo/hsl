!:
=/  answer  ,$(%correct %wrong)
=/  card  ,$(%2 %3 %4 %5 %6 %7 %8 %9 %10 %J %Q %K %A)
=/  move  ,$(%stand %hit %double %split)
|=  [myMove=move myHand=[card card] dealer=card]
=<
:-  checkMove  [myMove myHand dealer]
    nextHand
::
|%
:: returns a new pair of my hand cards + a new face-up card for the
++  nextHand
  ^-  [myHand=[card card] dealer=card]
  [myHand=[%A %3] dealer=%7]

:: returns an answer depending on whether myMove is optimal
++  checkMove
  |=  [myHand=[card card] dealer=card]
  ^-  `answer
  [~ %correct]

:: returns an answer unit
++  checkStand
  |=  [myHand=[card card] dealer=card]
  ^-  `answer
  [~ %correct]
