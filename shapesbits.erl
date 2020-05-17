-module(shapesbits).
-export([perimeter/1,area/1,enclose/1,bits/1,bits2/1]).

%% Function perimeter with many shapes
%% The shapes are on tuples
%% The pattern is {shape,Characteristic1, Characteristic2, Etc}

perimeter({square,Side}) ->
	Side * 4;

perimeter({rectangle,Height,Base}) ->
	(Height+Base) * 2;

perimeter({circle,Radius}) ->
	2 * Radius * math:pi();

perimeter({triangle,SideA,SideB,SideC}) ->
	SideA + SideB + SideC.

%% To keep the triangle pattern, I choose the Hero's Formula to calculate the area.

area({triangle,SideA,SideB,SideC}) ->
	P = perimeter({triangle,SideA,SideB,SideC}) / 2,
	math:sqrt(P*(P-SideA)*(P-SideB)*(P-SideC)).

enclose({square,Side}) ->
	{rectangle,Side,Side};

enclose({rectangle,Height,Base}) ->
	{rectangle,Height,Base};

enclose({circle,Radius}) ->
	Side = Radius * 2,
	{rectangle,Side,Side};

enclose({triangle,SideA,SideB,SideC}) ->
	A = area({triangle,SideA,SideB,SideC}),
	H = 2 * A / SideA,
	{rectangle,H,SideA}.

%% ----------------------------------------- Direct recursive

bits(0) ->
	0;

bits(1) ->
	1;

bits(N) when N > 1 ->
	N rem 2 + bits(N div 2).

%% ----------------------------------------- Tail recursive

bits2(N) when N >= 0 ->
	bits2(N,0).

bits2(0,Acc) ->
	Acc;

bits2(1,Acc) ->
	1 + Acc;

bits2(N,Acc) ->
	bits2(N div 2,Acc + N rem 2).

%% I prefer the bits2 with Accumulator because this is a better way to manage memory in functions.
