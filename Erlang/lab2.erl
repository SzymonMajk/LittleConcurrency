%% -*- coding: utf-8 -*-
-module(lab2).
-export([map_append/3,map_update/3,map_display/1,countTokensFromFile/1]).
-vsn(1.0).
-import(maps,[fold/3,to_list/1,update_with/3]).
-import(io,[fwrite/1]).
-import(lists,[map/2,foldl/3]).
-import(unicode,[characters_to_list/1]).
-import(string,[tokens/2]).
-import(file,[read_file/1]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zad 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_append(Key,Value,Map) -> Map#{Key => Value}.
map_update(Key,Value,Map) -> Map#{Key := Value}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zad 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

map_display(Map) -> print_elements(maps:to_list(Map)).
print_elements([]) -> io:fwrite("Koniec",[]);
print_elements([{K,V}]) -> io:fwrite("Key is: ~s,with value ~s~n",[K,V]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Zad 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

countTokensFromFile(Filename) -> 
    countTokens(tokens(fileToString(read_file(Filename))," \n"),dict:new()).

fileToString({_,FileBinaryContent}) -> 
    unicode:characters_to_list(FileBinaryContent).

%Almost...
%countTokens([],Dict) -> Dict;
%countTokens([Token|String],Dict) -> 
%    countTokens(String,dict:update_counter(Token,1,Dict)).

countTokens([],Dict) -> Dict;
countTokens([Token|String],Dict) -> 
    Fun = fun(V) -> V + 1 end,
    countTokens(String,dict:update_counter(Token,1,Dict)).










