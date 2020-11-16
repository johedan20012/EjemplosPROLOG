%Algoritmo para el calculo del n-esimo elemento de la sucesion de fibonacci usando su formula explicita como potencia de una matriz
:- module(fiboExpLog, [fibo/2]). %El predicado module/2 especifica que esto sera un modulo con nombre 'fiboExpLog' seguido de una lista con los predicados a exportar y su aridad

/* multiplicarMatrices2x2/3 toma 3 matrices y es verdadero si la tercera es el producto de la primera por la segunda

[X1,X2,X3,X4] => |X1 X2|   [Y1,Y2,Y3,Y4] => |Y1 Y2|  [R1,R2,R3,R4] => |R1 R2|
                 |X3 X4| ,                  |Y3 Y4|,                  |R3 R4|
*/
multiplicarMatrices2x2([X1,X2,X3,X4],[Y1,Y2,Y3,Y4],[R1,R2,R3,R4]):-    
    R1 is mod((X1*Y1)+(Y3*X2),10000009),
    R2 is mod((X1*Y2)+(Y4*X2),10000009),
    R3 is mod((X3*Y1)+(Y3*X4),10000009),
    R4 is mod((X3*Y2)+(Y4*X4),10000009).

accExpLogMatriz(Base ,1   ,Acc ,Res ):- 
    multiplicarMatrices2x2(Base,Acc,Res).
accExpLogMatriz(Base ,Exp ,Acc ,Res ):-
    0 is mod(Exp,2),
    NuevoExp is div(Exp,2),
    multiplicarMatrices2x2(Acc,Acc,NuevoAcc),
    accExpLogMatriz(Base,NuevoExp,NuevoAcc,Res).
accExpLogMatriz(Base ,Exp ,Acc ,Res ):-
    1 is mod(Exp,2),
    NuevoExp is div((Exp-1),2),
    multiplicarMatrices2x2(Base,Acc,NuevaBase),
    multiplicarMatrices2x2(Acc,Acc,NuevoAcc),
    accExpLogMatriz(NuevaBase,NuevoExp,NuevoAcc,Res).

expLogMatriz(Base,Exp,Res) :-
    accExpLogMatriz([1,0,0,1],Exp,Base,Res).

fibo(N,Fn):-
    expLogMatriz([0,1,1,1],N,[_,Fn,_,_]).