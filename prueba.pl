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

*/

% *****************************
%  -- Ejercicios integradores --
%  *****************************

% 1 - Saltos

% En una competencia de saltos, cada competidor puede hacer hasta 5 saltos; a cada salto se le asigna un puntaje de 0 a 10. Se define el predicado puntajes que relaciona cada competidor con los puntajes de sus saltos, p.ej.

puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

% Se pide armar un programa Prolog que a partir de esta información permita consultar:
% Qué puntaje obtuvo un competidor en un salto, p.ej. qué puntaje obtuvo Hernán en el salto 4 (respuesta: 6).
% Si un competidor está descalificado o no. Un competidor está descalificado si hizo más de 5 saltos. En el ejemplo, Julio está descalificado.
% Si un competidor clasifica a la final. Un competidor clasifica a la final si la suma de sus puntajes es mayor o igual a 28, o si tiene dos saltos de 8 o más puntos.

% Ayuda: investigar predicado nth1/3 y nth0/3 en el prolog.


puntaje(Persona, Salto, Puntaje) :-
    puntajes(Persona, ListaPuntos),
    nth1(Salto, ListaPuntos, Puntaje).

estaDescalificado(Persona) :-
    puntajes(Persona, ListaPuntos),
    length(ListaPuntos, CantidadSaltos),
    CantidadSaltos > 5.

clasificaALaFinal(Persona):-
	puntajes(Persona, ListaPuntos),
	sum_list(ListaPuntos,PuntajeTotal),
	PuntajeTotal >= 28.

clasificaALaFinal(Persona):-
		puntajes(Persona,ListaPuntos),
	     findall(PuntajeAlto, (member(PuntajeAlto, ListaPuntos), PuntajeAlto >= 8), MejoresSaltos),
        length(MejoresSaltos, CantidadSaltos),
        CantidadSaltos >= 2.
	

% Subtes

% En este ejercicio viene bien usar el predicado nth1/3, que relaciona un número, una lista, y el elemento de la lista en la posición indicada por el número (empezando a contar de 1). P.ej. prueben estas consultas

% ?- nth1(X,[a,b,c,d,e],d).
% ?- nth1(4,[a,b,c,d,e],X).
% ?- nth1(Orden,[a,b,c,d,e],Elem).
% ?- nth1(X,[a,b,c,d,e],j).
% ?- nth1(22,[a,b,c,d,e],X).

% Tenemos un modelo de la red de subtes, por medio de un predicado linea que relaciona el nombre de la linea con la lista de sus estaciones, en orden. P.ej. (reduciendo las lineas)

linea(a,[plazaMayo,peru,lima,congreso,miserere,rioJaneiro,primeraJunta,nazca]).
linea(b,[alem,pellegrini,callao,pueyrredonB,gardel,medrano,malabia,lacroze,losIncas,urquiza]).
linea(c,[retiro,diagNorte,avMayo,independenciaC,plazaC]).
linea(d,[catedral,nueveJulio,medicina,pueyrredonD,plazaItalia,carranza,congresoTucuman]).
linea(e,[bolivar,independenciaE,pichincha,jujuy,boedo,varela,virreyes]).
linea(h,[lasHeras,santaFe,corrientes,once,venezuela,humberto1ro,inclan,caseros]).
combinacion([lima, avMayo]).
combinacion([once, miserere]).
combinacion([pellegrini, diagNorte, nueveJulio]).
combinacion([independenciaC, independenciaE]).
combinacion([jujuy, humberto1ro]).
combinacion([santaFe, pueyrredonD]).
combinacion([corrientes, pueyrredonB]).

% No hay dos estaciones con el mismo nombre.

% Se pide armar un programa Prolog que a partir de esta información permita consultar:
% En qué linea está una estación, predicado estaEn/2.
% dadas dos estaciones de la misma línea, cuántas estaciones hay entre ellas, p.ej. entre Perú y Primera Junta hay 5 estaciones. Predicado distancia/3 (relaciona las dos estaciones y la distancia).
% Dadas dos estaciones de distintas líneas, si están a la misma altura (o sea, las dos terceras, las dos quintas, etc.), p.ej. Independencia C y Jujuy que están las dos cuartas. Predicado mismaAltura/2.
% Dadas dos estaciones, si puedo llegar fácil de una a la otra, esto es, si están en la misma línea, o bien puedo llegar con una sola combinación. Predicado viajeFacil/2.

	



