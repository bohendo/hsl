
:: Q1

=/  harvest  (my ~[['eggs' 5] ['squash' 4] ['tomato' 3]])

:: Q2

=/  harvest  (my ~[['eggs' 5] ['squash' 4] ['tomato' 3]])
=/  harvest  %-  %~  put  by  harvest  ['onion' 2]
harvest

:: Q3

=/  harvest  (my ~[['eggs' 5] ['squash' 4] ['tomato' 3]])
=/  harvest  %-  %~  del  by  harvest  'tomato'
harvest

:: Q4

=/  harvest  (my ~[['eggs' 5] ['squash' 4] ['tomato' 3]])
=/  harvest  %-  %~  get  by  harvest  'tomato'
(need harvest)

:: Q5

^-  (set tape)  (sy ["eggs" "squash" "tomato" ~])

:: Q6

=/  harvest  ^-  (set tape)  (sy ["eggs" "squash" "tomato" ~])
`(set tape)`(~(put in harvest) "onion")

:: Q7

=/  harvest  ^-  (set tape)  (sy ["eggs" "squash" "tomato" ~])
`(set tape)`(~(del in harvest) "tomato")

:: Q8

;:  add  1  2  3  4  5  ==

:: Q9

:: mutliple choice

:: Q10

:: boxcar
:: author: ~dibmet-narren
:: returns 1 if the input is greater than 3 but less than or equal to 5
:: otherwise returns 0
|=  x=@ud
^-  @ud
?:  ?&  (gth x 3)  (lte x 5)  ==  1  0

:: Q11

|=  x=@ud
^-  @ud
~&  x
?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
%~  $  .  8

:: Q12

/+  boxcar-lib
|=  x=@ud
^-  @ud
?:  ?&  (gth-3:boxcar-lib x)  (lte-5:boxcar-lib x)  ==  1  0

:: Q13

/+  *test
/=  boxcar  /gen/boxcar
|%
++  test-01
  %+  expect-eq
    !>  0
    !>  (boxcar 3)
++  test-02
  %+  expect-eq
    !>  1
    !>  (boxcar 5)
--

:: Q14

:-  %say
|=  [[now=@da eny=@uvJ bec=beak] [n=@ud ~] [x=@ud ~]]
:-  %noun
[(~(rad og eny) n) x]

:: Q15

:: mutliple choice

:: Q16

lent = list length
weld = concat two lists
trim = splits a tape, produces a cell with the two partial tapes pinned to `p` and `q`

High-level wrappers:

shift: calls operate and encoder to shift the given message forward by the given number of steps
unshift: calls operate and decoder to shift the given message backward by the given number of steps
encoder: calls rotation to get a shifted alphabet, calls space-addr to get the forward-shifting map
decoder: calls rotation to get a shifted alphabet, calls space-addr to get the backward-shifting map

Simple utilities:

alpha: simple variable that stores the alphabet
rotation: trims the alphabet using mod to wrap back around if too many steps are given, welds them back together in reverse order
space-adder: calls map-maker to get the mapping, then adds a new entry that maps spaces to itself

Core logic:

operate: performs the char-by-char remapping. An inner gate is defined that remaps one char and this gate is given to `turn` to apply it to each char of the message.
map-maker: returns a chart mapping each char of the key alphabet to the new shifted char of the value alphabet (unless the key and value alphabets have unequal lengths, in which case it crashes). Builds and kicks a trap that returns the output chart once it reaches the end, otherwise it adds the current pair of chars to the chart and recurses to the next pair.

:: Q17

