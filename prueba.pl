 % auto/1, es una propiedad
auto(ferrariF50).
auto(tesla).
auto(amarok).

color(tesla, verde).

% maneja/2 relaciona a una persona con el auto que maneja
maneja(mati, ferrariF50).
% decimos que Nico maneja carrito de golf y autos verdes
maneja(nico, carritoGolf).
maneja(nico, Auto):-
	auto(Auto),
	color(Auto, verde). % usamos la misma variable para decir que es el MISMO Auto
% Para expresar la disyunción de lo que puede hacer Nico lo expresamos con distintas cláusulas sobre el mismo prédicado

% sabeManejar/1 propiedad sobre una persona que determina si sabe manejar
sabeManejar(Persona):-
	maneja(Persona, Auto),
	auto(Auto).

padre(homero, lisa).
padre(homero, bart).
padre(homero, maggie).
padre(marge, lisa).
padre(marge, bart).
padre(marge, maggie).

padre(abraham, homero).
padre(abraham, herbert).

padre(mona, homero).

hijo(Hijo, Padre):- padre(Padre, Hijo).

hermano(Hermano1, Hermano2):-
	padre(Padre, Hermano1),
	padre(Padre, Hermano2),
	Hermano1 \= Hermano2.

tio(Tio, Sobrino):-
	hermano(Tio, Padre),
	padre(Padre, Sobrino).

abuelo(Abuelo, Nieto):-
	padre(Abuelo, Padre),
	padre(Padre, Nieto).

primo(Primo1, Primo2):-
	tio(Tio, Primo1),
	padre(Tio, Primo2).


%ancestro/2