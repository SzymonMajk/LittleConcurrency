%  ProdCons.erl
-module(prodcons).
-compile([export_all]).

produce(Posr,0) -> 
	Posr ! {prod,0},
	{producentZakonczyl};
produce(Posr,N) -> 
	Posr ! {prod,N},
	produce(Posr,N-1).
	
between(Cons) ->
	receive
		{prod,0} -> 
			Cons ! {cons,0};
		{prod,N} -> 
			Cons ! {cons,N},
			between(Cons)
	end.
	
consume() ->
	receive
		{cons,0} -> io:format("Consumer has nothing to do...");
		{cons,N} -> io:format("Consumer got: ~p ~n",[N]),
		consume()
	end.
	
main() ->
	ConsPID = spawn(prodcons,consume,[]),
	BetwPID = spawn(prodcons,between,[ConsPID]),
	spawn(prodcons,produce,[BetwPID,5]),
	{ok}.