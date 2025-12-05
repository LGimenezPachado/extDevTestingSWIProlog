%punto 1%
jockey(valdivieso,155,52).
jockey(leguisamo,161,49).
jockey(lezcano,149,50).
jockey(baratucci,153,55).
jockey(falero,157,52).

caballo(botafogo).
caballo(oldMan).
caballo(energica).
caballo(matBoy).

leGusta(botafogo, Nombre):-
    jockey(Nombre,_,Peso),
    Peso < 52.

leGusta(botafogo, baratucci).

leGusta(oldMan, Nombre):-
    jockey(Nombre,_,_),
    atom_length(Nombre, Caracteres),
    Caracteres > 7.

leGusta(energica, Nombre):-
    	Nombre \= baratucci.

leGusta(matBoy, Nombre):-
    jockey(Nombre,Altura,_),
    Altura > 170.

gano(botafogo, [granPremioNacional, granPremioRepublica]).
gano(oldMan, [granPremioRepublica, campeonatoPalermoDeOro]).
gano(matBoy, [granPremioCriadores]).
   
stud([valdivieso, falero], elTute).
stud(lezcano, lasHormigas).
stud([leguisamo, baratucci], elCharabon).

%punto 2%
prefiereMasDeUno(Caballo):-
    caballo(Caballo),
    findall(
        NombreJockey,
        leGusta(Caballo,NombreJockey),
        ListaJockeys
        ),
    length(ListaJockeys,Cantidad),
    Cantidad >1.

%punto 3%
noPrefiereStud(caballo,stud):-
    caballo(Caballo).
    

%punto 4%


%punto 5%

%punto &%

