=/  animal  ?(%penguin %turtle %cow %chicken %lemur)
=/  animal-tracker  ,[species=animal name=@t meals=@ud]
=/  at  ^-  animal-tracker  [%cow 'bessie' 314]
?-  species.at
%penguin  =.(meals.at (add meals.at 30) at)
%turtle  =.(meals.at (add meals.at 1) at)
%cow  =.(meals.at (add meals.at 100) at)
%chicken  =.(meals.at (add meals.at 7) at)
%lemur  =.(meals.at (add meals.at 2) at)
==
