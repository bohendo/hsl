
:: Q1

=/  x  0
|%
++  $  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
--

:: Q2

=>
=/  x  0
|%
++  $  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
--
=>  %=  .  x  3  ==  $

=>
=/  x  0
|%
++  $  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
--
%~  $  .  4

=>
=/  x  0
|%
++  $  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
--
%-  .  3

:: Q3

=>
|_  x=@ud
++  $  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
--
%-  .  4

:: Q4

=>  |=  x=@ud  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
=>  %=  .  x  3  ==  $

=>  |=  x=@ud  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
%~  $  .  4

=>  |=  x=@ud  ?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
%-  .  4

:: Q5

=>
|=  x=@ud
^-  @ud
?:  ?&  (gth x 3)  (lte x 5)  ==  1  0
%-  .  6

:: Q7

=>  mul  +2

:: Q8

=>  mul  +6

:: Q9

=/  quadratic
|_  [a=@ud b=@ud c=@ud]
++  $
  |=  x=@ud
  ^-  @ud
  (add (mul a (mul x x)) (add (mul b x) c))
--

:: Q10

=/  quadratic
|_  [a=@ud b=@ud c=@ud]
++  $
  |=  x=@ud
  ^-  @ud
  (add (mul a (mul x x)) (add (mul b x) c))
--
~($ quadratic [3 2 1])

:: Q11

=/  quadratic
|_  [a=@ud b=@ud c=@ud]
++  $
  |=  x=@ud
  ^-  @ud
  (add (mul a (mul x x)) (add (mul b x) c))
--
%-  ~($ quadratic [3 2 1])  5

:: Q12

=>
=/  n  5
=/  counter  0
|%
++  $
  ?:  .=  n  .+  counter
    counter
  %=  $
  counter  .+  counter
  ==
--
$

:: Q13

=>
=/  n  5
=/  counter  0
|.
  ?:  .=  n  .+  counter
    counter
  %=  $
  counter  .+  counter
  ==
$

:: Q14

=/  n  5
=/  counter  0
|-
  ?:  .=  n  .+  counter
    counter
  %=  $
  counter  .+  counter
  ==

:: Q15 (TODO)

=/  decrement
|_  n=@ud
++  $
  |=  counter=@ud
  ^-  @ud
  (add (mul a (mul x x)) (add (mul b x) c))
--
~($ quadratic [3 2 1])

=/  n  5
=/  counter  0
|-
  ?:  .=  n  .+  counter
    counter
  %=  $
  counter  .+  counter
  ==


:: Q16

:: Q17

:: Q18
