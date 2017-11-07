%% -*- coding: utf-8 -*-
-module(tree).
-vsn(1.0).
-export([init/0,putElem/2,getValue/1,randomInsert/2,list2Tree/2,tree2ListPre/1,
	tree2ListIn/1,tree2ListPost/1,searchBoolean/2,searchThrow/2]).
-import(rand,[uniform/1]).

%%% Private %%%

getValue({V,_,_}) -> V.
%getLeft({_,L,_}) -> L.
%getRight({_,_,R}) -> R.

%%% Public %%%

init() -> {nil,nil,nil}.

putElem(Elem,{nil,nil,nil}) ->
	{Elem,init(),init()};
putElem(Elem,{Old,Left,Right}) ->
	if 
		Elem < Old ->
			{Old,putElem(Elem,Left),Right};
		Elem > Old ->
			{Old,Left,putElem(Elem,Right)};
	true ->
		{Old,Left,Right}
	end.
	
randomInsert(0,Tree) ->
	Tree;
randomInsert(Range,Tree) ->
	randomInsert(Range-1,putElem(uniform(50),Tree)).
	
list2Tree([],Tree) ->
	Tree;
list2Tree([H|T],Tree) ->
	list2Tree(T,putElem(H,Tree)).
	
% TODO!
	
tree2ListPre({Val,nil,nil}) ->
	[Val|[]];
tree2ListPre({Val,nil,Left}) ->
	[Val|tree2ListPre(Left)];
tree2ListPre({Val,Right,_}) ->
	[Val|tree2ListPre(Left)] ++ tree2ListPre(Right).
	
tree2ListIn({Val,nil,nil}) ->
	0;
tree2ListIn({Val,nil,Left}) ->
	0;
tree2ListIn({Val,Right,_}) ->
	[].
	
tree2ListPost({Val,nil,nil}) ->
	0;
tree2ListPost({Val,nil,Left}) ->
	0;
tree2ListPost({Val,Right,_}) ->
	[].
	
searchBoolean(Elem,Tree) -> {true,Elem}.

searchThrow(Elem,Tree) -> throw(Elem).
	
% test creation: tree:list2Tree([6,3,2,2,8,1],tree:init()).
% test sort: tree:tree2ListPre(tree:list2Tree([6,3,2,2,8,1],tree:init())).
% test search ... TODO!
