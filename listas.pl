%TODO Traducir esto http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse13

%Este hecho y la regla, permiten saber si un elemento X esta en una lista [H|T]
miembro(X,[X|_]). %miembro(X,[X|T]) siembre es verdad, esto quiere decir que si un elemento es igual a la cabeza de una lista, entonces el elemento es miembro de la lista
miembro(X,[_|T]) :- miembro(X,T). %miembro(X,[_|T]) es verdad si miembro(X,T) es verdad, esto quiere decir que un elemento es miembro de una lista si se encuentra dentro de la cola de la misma

a2b([],[]).
a2b([a|T1],[b|T2]) :-
    a2b(T1,T2).

tran(eins,one).
tran(zwei,two).
tran(drei,three).
tran(vier,four).
tran(fuenf,five).
tran(sechs,six).
tran(sieben,seven).
tran(acht,eight).
tran(neun,nine).

listtran([],[]).
listtran([H1|T1],[H2|T2]) :-
    tran(H1,H2),
    listtran(T1,T2).

twice([],[]).
twice([H1|T1],[H1,H1|T2]) :-
    twice(T1,T2).

combine1([]     ,[]     ,[]     ).
combine1([H1|T1],[H2|T2],[H1,H2|T3]) :-
    combine1(T1,T2,T3).

combine2([],[],[]).
combine2([H1|T1],[H2|T2],[[H1,H2]|T3]) :-
    combine2(T1,T2,T3).

combine3([],[],[]).
combine3([H1|T1],[H2|T2],[j(H1,H2)|T3]) :-
    combine3(T1,T2,T3).