%TODO: this one http://lpn.swi-prolog.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse24

append([],L,L).
append([H|T],L2,[H|L3]) :- append(T,L2,L3). %Nota: usar append solo si es absolutamente necesario

prefix(P,L) :-
    append(P,_,L).

suffix(S,L):- 
    append(_,S,L).

sublist(SubL,L):- suffix(S,L), prefix(SubL,S).

accRev([H|T],A,R):- accRev(T,[H|A],R).
accRev([],A,A).

rev(L,R):- accRev(L,[],R).

doubled(L) :-
    append(M,M,L).

palindrome(L):-
    rev(L,L).
    