%Parsing de formulas de la logica proposicional usando DCG(Definite Clause Grammars)

proposicion(AT) --> atomo(AT).
proposicion(neg(PRO)) --> ['!'],proposicion(PRO).
proposicion(dis(PRO1,PRO2)) --> proposicion(PRO1), ['|'], proposicion(PRO2).
proposicion(con(PRO1,PRO2)) --> proposicion(PRO1), ['&'], proposicion(PRO2).
proposicion(imp(PRO1,PRO2)) --> proposicion(PRO1), ['=>'], proposicion(PRO2).
proposicion(equ(PRO1,PRO2)) --> proposicion(PRO1), ['<=>'], proposicion(PRO2).

atomo(at(p)) --> [p].
atomo(at(q)) --> [q].
atomo(at(r)) --> [r].
atomo(at(s)) --> [s].
atomo(at(t)) --> [t].
