%  parMap.erl
-module(parMap).
-compile([export_all]).
-import(maps,[new/0,to_list/1,put/3]).

testFunction(Number) -> Number + 1.

executeFunction(Element,Function,Receiver,Index) ->
	Receiver ! {Index,Function(Element)}.

spawnForEvery([],_,_) -> ok;
spawnForEvery([H|T],F,Index) -> 
	spawn(parMap,executeFunction,[H,F,self(),Index]),
	spawnForEvery(T,F,Index+1).

collectResults(N,Map) ->
	receive
		{N,_} -> Map;
		{Index,Result} -> collectResults(Index,maps:put(Index,Result,Map))
	end.

functionManager(List,F) ->
	spawnForEvery(List,F,1).
	%maps:to_list(collectResults(length(List),maps:new())).