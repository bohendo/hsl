!:

:: define types
=/  answer  ?(%correct %wrong)
=/  card  ?(%n2 %n3 %n4 %n5 %n6 %n7 %n8 %n9 %n10 %j %q %k %a)
=/  move  ?(%stand %hit %double %split)
=/  table-state  ,[my-hand=[card card] dealer=card]
=/  table-action  ,[my-move=move my-state=table-state]

:: declare entry gate
|=  my-action=table-action

:: define entry action
=<
:-  (check-move my-action)
    (next-hand)
:: declare main core
|%

:: return a new random table state
++  next-hand
  ^-  table-state
  [my-hand=[%a %n3] dealer=%n7] :: guaranteed random, chosen with fair dice

:: returns an answer depending on whether my-move is optimal
++  check-move
  |=  table-action
  ^-  (unit answer)
  [~ %correct]

:: returns an answer unit
++  check-stand
  |=  table-state
  ^-  (unit answer)
  [~ %correct]
--
