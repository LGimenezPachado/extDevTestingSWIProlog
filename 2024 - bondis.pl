% Recorridos en GBA:
recorrido(17, gba(sur), mitre).
recorrido(24, gba(sur), belgrano).
recorrido(247, gba(sur), onsari).
recorrido(60, gba(norte), maipu).
recorrido(152, gba(norte), olivos).

% Recorridos en CABA:
recorrido(17, caba, santaFe).
recorrido(152, caba, santaFe).
recorrido(10, caba, santaFe).
recorrido(160, caba, medrano).
recorrido(24, caba, corrientes).

%punto 1%
seCruzan(Linea1,Linea2):-
    recorrido(Linea1,_,Calle),
    recorrido(Linea2,_,Calle).

%punto 2%
esNacional(Linea):-
    recorrido(Linea,caba,_),
    recorrido(Linea,Zona,_),
    Zona \= caba.

esProvincial(Linea):-
    recorrido(Linea,Zona,_),
    Zona \= caba,
    not(esNacional(Linea)).

%punto 3%
calleMasTransitada(Zona):-
    recorrido(Lineas,Zona,Calle),
    
    
