-module(lab1_1).
-export([area/1,len/1,multiArea/1,amax/1,amin/1,tmin_max/1,lmin_max/1,
decreaseList/1,convertTemperature/2,generateListOfElement/2]).
 
area({square,X,Y}) ->  X*Y;
area({circle,X}) -> 3.14*X*X;
area({triangle,A,H}) -> A*H;
area({trapeze,A,B,H}) -> (A+B)*H/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

len([]) -> 0;
len([_|T]) -> 1 + len(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

multiArea([]) -> [];
multiArea([K|T]) -> [area(K)|multiArea(T)].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

amax([H|T]) -> max_(T, H).
max_([H|T], Max) when H > Max -> max_(T, H);
max_([_|T], Max)              -> max_(T, Max);
max_([],    Max) -> Max.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

amin([H|T]) -> min_(T, H).
min_([H|T], Min) when H < Min -> min_(T, H);
min_([_|T], Min)              -> min_(T, Min);
min_([],    Min) -> Min.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tmin_max([H|T]) -> {min(T,H),max(T,H)}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

lmin_max([H|T]) -> [min(T,H),max(T,H)|[]].

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

decreaseList(N) when N < 1 -> [];
decreaseList(N) -> [N|decreaseList(N-1)]. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

convertTemperature({c,Value},f) -> (Value * 9/5) + 32;
convertTemperature({c,Value},k) -> Value + 273;
convertTemperature({f,Value},c) -> (Value - 32) * 5 / 9.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

generateListOfElement(Length,_) when Length < 1 -> [];
generateListOfElement(Length,Elem) -> [Elem|generateListOfElement(Length-1,Elem)].
