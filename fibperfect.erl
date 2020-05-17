-module(fibperfect).
-export([fib/1,perfect/1]).

fib(N) when N >= 0 ->
        fib(N,1,0).

fib(0,_,Y) ->
        Y;

fib(N,X,Y) ->
        fib(N-1,X+Y,X).

% fib(4) -> fib(4,1,0) -> fib(3,1,1) -> fib(2,2,1) -> fib(1,3,2) -> fib(0,5,3) -> 3.

perfect(0) ->
        false;

perfect(N) when N > 0 ->
        perfect(N,0,1).

perfect(N,N,N) ->
        true;

perfect(N,_,N) ->
        false;

perfect(N,Acc,Y) when N rem Y == 0 ->
        perfect(N,Acc+Y,Y+1);

perfect(N,Acc,Y) when N rem Y /= 0 ->
        perfect(N,Acc,Y+1).
