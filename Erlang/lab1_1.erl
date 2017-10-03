-module(lab1_1).
-export([pole/1,len/1,multi_pole/1]).
 
pole({kwadrat,X,Y}) ->  X*Y;
pole({kolo,X}) -> 3.14*X*X;
pole({trojkat,A,H}) -> A*H;
pole({trapez,A,B,H}) -> (A+B)*H/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

len([]) -> 0;
len([_|T]) -> 1 + len(T).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

multi_pole([]) -> [];
multi_pole([K|T]) -> [pole(K)|multi_pole(T)].