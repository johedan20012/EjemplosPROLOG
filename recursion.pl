% todo: Ya te la sandwich http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse9

descendiente(X,Y) :- hijo(X,Y).

descendiente(X,Y) :- hijo(X,Z), descendiente(Z,Y).

hijo(kevin,jose).
hijo(jose,luis).
hijo(luis,delfino).
hijo(delfino,ulises).


numeral(0).

numeral(succ(X)) :- numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z)) :-
        add(X,Y,Z).
