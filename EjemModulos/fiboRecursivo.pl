%Algoritmo recursivo para el calculo del n-esimo elemento de la sucesion de fibonacci
:- module(fiboRecu, [fibo/2]). %El predicado module/2 especifica que esto sera un modulo con nombre 'fiboRecu' seguido de una lista con los predicados a exportar y su aridad

fibonacci(0,0):- !.
fibonacci(1,1):- !.
fibonacci(N,Res):-
    N1 is N-1,
    fibonacci(N1,Res1),
    N2 is N-2,
    fibonacci(N2,Res2),
    Res is Res1+Res2.

fibo(N,Res):-
    fibonacci(N,Res).