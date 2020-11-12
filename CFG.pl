% Código de ejemplo de una CFG(Context Free Grammar)

/* oracion(Z):- sujeto(X), predicado(Y), append(X,Y,Z).

sujeto(Z):- articulo(X), nombre(Y), append(X,Y,Z).

articulo([el]).
articulo([la]).
nombre([casa]).
nombre([chico]).
predicado(Z):- verbo(X), complemento(Y),append(X,Y,Z).
verbo([corre]).
verbo([es]).
complemento([obediente]).
complemento([bonita]). 
 */

 /* oracion(X,Z):- sujeto(X,Y), predicado(Y,Z).

sujeto(X,Z):- articulo(X,Y), nombre(Y,Z).

articulo([el|W],W).
articulo([la|W],W).
nombre([casa|W],W).
nombre([chico|W],W).

predicado(X,Z):- verbo(X,Y), complemento(Y,Z).
            
verbo([corre|W],W).
verbo([es|W],W).
complemento([obediente|W],W).
complemento([bonita|W],W).   */

 /* oracion --> sujeto, predicado.

sujeto --> articulo, nombre.
articulo --> [el].
articulo --> [la].
nombre --> [casa].
nombre --> [chico].
predicado --> verbo, complemento.
            
verbo --> [corre].
verbo --> [es].
complemento --> [obediente].
complemento --> [bonita].   */

 oracion(o(SU,PRE)) --> sujeto(SU), predicado(PRE).

sujeto(su(AR,NOM)) --> articulo(AR), nombre(NOM).
articulo(ar(el)) --> [el].
articulo(ar(la)) --> [la].
nombre(nom(casa)) --> [casa].
nombre(nom(chico)) --> [chico].
predicado(pre(VER,COM)) --> verbo(VER), complemento(COM).
            
verbo(ver(corre)) --> [corre].
verbo(ver(es)) --> [es].
complemento(com(obediente)) --> [obediente].
complemento(com(bonita)) --> [bonita].  