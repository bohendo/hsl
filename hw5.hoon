
:: Q1

|%  ++  one  1  ++  two  2  ++  three  3  --

=<  three  |%  ++  one  1  ++  two  2  ++  three  3  --

:: Q2

=/  n  0  =>  |%  ++  $  .+  n  --  $

:: Q3

=/  at  [%penguin 'happy' 3]
=>  |%
++  animal  ?(%penguin %turtle %cow %chicken %lemur)
++  animal-tracker  ,[species=animal name=@t meals=@ud]
--
^-  animal-tracker  at

:: Q4
:: Q5
:: Q6
:: Q7
:: Q8

=>  |%
++  $  "dirt"
++  core-in-arm
  |%
  ++  $  "buried treasure"
  --
--
=>  core-in-arm  $

:: Q9

=>  |%
++  $  "dirt"
++  core1
  |%
  ++  $  "trea"
  --
++  core2
  |%
  ++  $  "sure"
  --
--
%+  weld  $:core1  $:core2

:: Q10

=/  text  "s"
=>  |%
++  $  "sure"
--
=>  |% 
++  $  "dirt"
--
=>  |%
++  $  "dirt"
++  core-in-arm
  |%
  ++  $  "trea"
  --
--
%+  weld  $:core-in-arm  %+  weld  ^^$  text

:: Q11

=/  [a=@ud b=@ud]  [0 0]
=>  |%
++  add-arm  %+  add  a  b
++  sub-arm  %+  sub  a  b
++  mul-arm  %+  mul  a  b
++  div-arm  %+  div  a  b
--
add-arm

:: Q12

=/  [a=@ud b=@ud]  [*@ud *@ud]
=>  |%
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
add-arm

:: Q13

=>  =/  [a=@ud b=@ud]  [*@ud *@ud]
|%
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
%=  .  a  3  b  4  ==

=>  =/  [a=@ud b=@ud]  [*@ud *@ud]
|%
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
.(a  3  b  4)

:: Q14

=>  =/  [a=@ud b=@ud]  [*@ud *@ud]
|%
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
=>  %=  .  a  3  b  4  ==
add-arm

:: Q15

=>  |_  [a=@ud b=@ud]
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
=>  %=  .  a  3  b  4  ==
add-arm

:: Q16

=>  |_  [a=@ud b=@ud]
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
%~  add-arm  .  [3 4]

:: Q17

=>  |_  [a=@ud b=@ud]
++  add-arm  (add a b)
++  sub-arm  (sub a b)
++  mul-arm  (mul a b)
++  div-arm  (div a b)
--
~(mul-arm . [~(add-arm . [3 5]) ~(div-arm . [4 2])])
