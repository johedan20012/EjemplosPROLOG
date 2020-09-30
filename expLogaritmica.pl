%Version recursiva del algoritmo para la exponensiación logaritmica de un número real con exponente natural
/* Ejemplos

    Entrada        Salida       Descripción
 ┌─────────────┬─────────────┬────────────────────┐
 │   2,2       │     4       │ 2^2 = 2*2 = 4      │
 ├─────────────┼─────────────┼────────────────────┤
 │   5,3       │    125      │ 5^3 = 5*5*5 = 125  │
 ├─────────────┼─────────────┼────────────────────┤
 │   3,4       │     81      │ 3^4 = 3*3*3*3 = 81 │
 ├─────────────┼─────────────┼────────────────────┤
 │   1,4       │     1       │ 1^4 = 1*1*1*1 = 1  │
 └─────────────┴─────────────┴────────────────────┘

------------------------------------INICIO NOTA IMPORTANTE----------------------------
Para exponentes mayores a 1,000,000 recomiendo modular la respuesta ya que puede tomar mucha memoria la multiplicacion
de numeros enormes.

Reemplazar las 2 lineas: 
    -1. Res is Base*Res1   -> Por la linea  -> Res is mod(Base*Res1,100000009) 
    -2. Res is Res1*Res1   -> Por la linea  -> Res is mod(Res1*Res1,100000009).
------------------------------------FIN NOTA IMPORTANTE-------------------------------
*/

% Los siguientes 2 predicados sirven para obtener el resultado de elevar un numero "Base" a la potencia "Exp", usando recursión sin cola

potenciaSLOW(Base,1,Base).
potenciaSLOW(Base,Exp,Res) :-
    NuevoExp is Exp-1,
    potenciaSLOW(Base,NuevoExp,Res1),
    Res is mod(Res1*Base,100000009).

% Los siguientes 3 predicados sirven para obtener el resultado de elevar un numero "Base" a la potencia "Exp", usando recursión con cola

accPotenciaSLOW(_,1,Acc,Acc).
accPotenciaSLOW(Base,Exp,Acc,Res) :-
    NuevoExp is Exp-1,
    NuevoAcc is mod(Base*Acc,100000009),
    accPotenciaSLOW(Base,NuevoExp,NuevoAcc,Res).

potenciaSLOWTail(Base,Exp,Res) :-
    accPotenciaSLOW(Base,Exp,1,Res).

% Los siguientes 3 predicados sirven para obtener el resultado de elevar un numero "Base" a la potencia "Exp", usando el algoritmo
% de exponenciación logaritmica en forma recursiva.

potenciaLog(Base,1,Base).
potenciaLog(Base,Exp,Res) :-
    1 is mod(Exp,2),
    NuevoExp is Exp-1,
    potencia(Base,NuevoExp,Res1),
    Res is mod(Base*Res1,100000009).
potenciaLog(Base,Exp,Res) :-
    0 is mod(Exp,2),
    NuevoExp is div(Exp,2),
    potencia(Base,NuevoExp,Res1),
    Res is mod(Res1*Res1,100000009).

% Los siguientes 4 predicados sirven para obtener el resultado de elevar un numero "Base" a la potencia "Exp", usando el algoritmo
% de exponenciación logaritmica en forma recursiva con cola.

accPotenciaLog(Base    ,1   ,Acc ,Res ) :- 
    Res is mod(Base*Acc,100000009).
accPotenciaLog(Base ,Exp ,Acc ,Res ) :-
    0 is mod(Exp,2),
    NuevoExp is div(Exp,2),
    NuevoAcc is mod(Acc*Acc,100000009),
    accPotencia(Base,NuevoExp,NuevoAcc,Res).
accPotenciaLog(Base ,Exp ,Acc ,Res ) :-
    1 is mod(Exp,2),
    NuevoExp is div((Exp-1),2),
    NuevaBase is mod(Base*Acc,100000009),
    NuevoAcc is mod(Acc*Acc,100000009),
    accPotencia(NuevaBase,NuevoExp,NuevoAcc,Res).

potenciaLogTail(Base,Exp,Res) :-
    accPotencia(1,Exp,Base,Res).
    