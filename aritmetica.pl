% TODO: The same thing http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse18

multi(A,B,Result) :-
    Result is A*B.

len([],0).
len([_|T],N) :-
    len(T,X),
    N is X+1.

accMayor([H|T],A,Max) :-
    H > A,
    accMayor(T,H,Max).
 
accMayor([H|T],A,Max) :-
    H =< A,
    accMayor(T,A,Max).
 
accMayor([],A,A).

mayor(Lista,Maximo) :-
    Lista = [H|_],
    accMayor(Lista,H,Maximo).

increment(X,Y) :-
    Y is X+1. 


accFactorial(1,ACC,ACC).
accFactorial(N,ACC,RES) :-
    X is N-1,
    Y is ACC*N,
    accFactorial(X,Y,RES).

factorial(N,RES) :-
    accFactorial(N,1,RES).

factorial2(0,1).
factorial2(N,RES) :-
    N1 is N-1,
    factorial2(N1,RES1),
    RES is N*RES1.

accFibo(0,[A,_],A).
accFibo(1,[_,B],B).
accFibo(N,[A,B],RES):-
    SIG is A+B,
    N1 is N-1,
    accFibo(N1,[B,SIG],RES).

fibo(N,RES) :-
    accFibo(N,[0,1],RES).
