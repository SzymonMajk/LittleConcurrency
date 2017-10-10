%% -*- coding: utf-8 -*-
-module(lab2).
-export([map_append/3,map_update/3,map_display/1]).
-vsn(1.0).
-import(maps,[fold/3,to_list/1]).
-import(io,[fwrite/1]).
-import(lists,[map/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zad 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_append(Key,Value,Map) -> Map#{Key => Value}.
map_update(Key,Value,Map) -> Map#{Key := Value}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zad 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_display(Map) -> print_elements(maps:to_list(Map)).
print_elements([]) -> io:fwrite("Koniec",[]);
print_elements([{K,V}]) -> io:fwrite("Key is: ~s,with value ~s~n",[K,V]).