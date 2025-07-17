 /*
 % auto/1, es una propiedad 
auto(ferrariF50).
auto(tesla).
auto(amarok).
moto(kawasaki).

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

siguiente(N, Siguiente):- Siguiente is N + 1. 

Ejercicios integradores

1 - Saltos

En una competencia de saltos, cada competidor puede hacer hasta 5 saltos; a cada salto se le asigna un puntaje de 0 a 10. Se define el predicado puntajes que relaciona cada competidor con los puntajes de sus saltos, p.ej.

puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

Se pide armar un programa Prolog que a partir de esta información permita consultar:
Qué puntaje obtuvo un competidor en un salto, p.ej. qué puntaje obtuvo Hernán en el salto 4 (respuesta: 6).
Si un competidor está descalificado o no. Un competidor está descalificado si hizo más de 5 saltos. En el ejemplo, Julio está descalificado.
Si un competidor clasifica a la final. Un competidor clasifica a la final si la suma de sus puntajes es mayor o igual a 28, o si tiene dos saltos de 8 o más puntos.

Ayuda: investigar predicado nth1/3 y nth0/3 en el prolog.

*/

puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

puntajeSalto(Persona, Posicion, Puntaje) :-
    puntajes(Persona, Lista),
    nth1(Posicion, Lista, Puntaje).

