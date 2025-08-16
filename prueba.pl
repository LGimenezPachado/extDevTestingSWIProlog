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

%******
% 1 - Saltos
%******

% En una competencia de saltos, cada competidor puede hacer hasta 5 saltos; a cada salto se le asigna un puntaje de 0 a 10. Se define el predicado puntajes que relaciona cada competidor con los puntajes de sus saltos, p.ej.

%Base de conocimientos
puntajes(hernan,[3,5,8,6,9]).
puntajes(julio,[9,7,3,9,10,2]).
puntajes(ruben,[3,5,3,8,3]).
puntajes(roque,[7,10,10]).

% Se pide armar un programa Prolog que a partir de esta información permita consultar:
% Qué puntaje obtuvo un competidor en un salto, p.ej. qué puntaje obtuvo Hernán en el salto 4 (respuesta: 6).
% Si un competidor está descalificado o no. Un competidor está descalificado si hizo más de 5 saltos. En el ejemplo, Julio está descalificado.
% Si un competidor clasifica a la final. Un competidor clasifica a la final si la suma de sus puntajes es mayor o igual a 28, o si tiene dos saltos de 8 o más puntos.

% Ayuda: investigar predicado nth1/3 y nth0/3 en el prolog.

%Que puntaje obtuvo?
puntaje(Persona, Salto, Puntaje) :-
    puntajes(Persona, ListaPuntos),
    nth1(Salto, ListaPuntos, Puntaje).

%Esta descalificado
estaDescalificado(Persona) :-
    puntajes(Persona, ListaPuntos),
    length(ListaPuntos, CantidadSaltos),
    CantidadSaltos > 5.

%Clasificado a la final
clasificaALaFinal(Persona):-
	puntajes(Persona, ListaPuntos),
	sum_list(ListaPuntos,PuntajeTotal),
	PuntajeTotal >= 28.

clasificaALaFinal(Persona):-
		puntajes(Persona,ListaPuntos),
	     findall(PuntajeAlto, (member(PuntajeAlto, ListaPuntos), PuntajeAlto >= 8), MejoresSaltos),
        length(MejoresSaltos, CantidadSaltos),
        CantidadSaltos >= 2.
	
%******
% 2 - Subtes
%******

% En este ejercicio viene bien usar el predicado nth1/3, que relaciona un número, una lista, y el elemento de la lista en la posición indicada por el número (empezando a contar de 1). P.ej. prueben estas consultas

% ?- nth1(X,[a,b,c,d,e],d).
% ?- nth1(4,[a,b,c,d,e],X).
% ?- nth1(Orden,[a,b,c,d,e],Elem).
% ?- nth1(X,[a,b,c,d,e],j).
% ?- nth1(22,[a,b,c,d,e],X).

% Tenemos un modelo de la red de subtes, por medio de un predicado linea que relaciona el nombre de la linea con la lista de sus estaciones, en orden. P.ej. (reduciendo las lineas)

%Base de conocimientos
linea(a,[plazaMayo,peru,lima,congreso,miserere,rioJaneiro,primeraJunta,nazca]).
linea(b,[alem,pellegrini,callao,pueyrredonB,gardel,medrano,malabia,lacroze,losIncas,urquiza]).
linea(c,[retiro,diagNorte,avMayo,independenciaC,plazaC]).
linea(d,[catedral,nueveJulio,medicina,pueyrredonD,plazaItalia,carranza,congresoTucuman]).
linea(e,[bolivar,independenciaE,pichincha,jujuy,boedo,varela,virreyes]).
linea(h,[lasHeras,santaFe,corrientes,once,venezuela,humberto1ro,inclan,caseros]).
combinacion([lima, avMayo]). %a/c
combinacion([once, miserere]). %a/h
combinacion([pellegrini, diagNorte, nueveJulio]). %b/c/d
combinacion([independenciaC, independenciaE]). %c/e
combinacion([jujuy, humberto1ro]). %e/h
combinacion([santaFe, pueyrredonD]). %h/d
combinacion([corrientes, pueyrredonB]). %h/b 

% No hay dos estaciones con el mismo nombre.

% Se pide armar un programa Prolog que a partir de esta información permita consultar:

% En qué linea está una estación, predicado estaEn/2.
% dadas dos estaciones de la misma línea, cuántas estaciones hay entre ellas, p.ej. entre Perú y Primera Junta hay 5 estaciones. Predicado distancia/3 (relaciona las dos estaciones y la distancia).
% Dadas dos estaciones de distintas líneas, si están a la misma altura (o sea, las dos terceras, las dos quintas, etc.), p.ej. Independencia C y Jujuy que están las dos cuartas. Predicado mismaAltura/2.
% Dadas dos estaciones, si puedo llegar fácil de una a la otra, esto es, si están en la misma línea, o bien puedo llegar con una sola combinación. Predicado viajeFacil/2.

%linea(Linea,ListaEstaciones)
%combinacion(ListaEstaciones)

%En que linea esta una estacion
estaEn(Linea,Estacion):-
	linea(Linea,ListaEstaciones),
	member(Estacion,ListaEstaciones).

%Distancia entre estaciones de la misma linea
distancia(Estacion1, Estacion2, Distancia) :-
    linea(_, ListaEstaciones),
    nth1(Pos1, ListaEstaciones, Estacion1),
    nth1(Pos2, ListaEstaciones, Estacion2),
    Distancia is abs(Pos1 - Pos2).

%Comparacion altura de distintas lineas
mismaAltura(Estacion1,Estacion2):-
	linea(Linea1,ListaEstaciones1),
	linea(Linea2,ListaEstaciones2),
	Linea1\=Linea2,
	nth1(Pos1,ListaEstaciones1,Estacion1),
	nth1(Pos2,ListaEstaciones2,Estacion2),
	Pos1 = Pos2.

%Viaje facil (Misma linea o una sola combinacion)
viajeFacil(Estacion1,Estacion2):-
	linea(_,ListaEstaciones),
	member(Estacion1,ListaEstaciones),
	member(Estacion2,ListaEstaciones).

viajeFacil(Estacion1,Estacion2):-
	linea(Linea1,ListaEstaciones1),
	linea(Linea2,ListaEstaciones2),
	Linea1\=Linea2,
	member(Estacion1,ListaEstaciones1),
	member(Estacion2,ListaEstaciones2),
	combinacion(ListaCombinaciones),
    member(EstacionCombinacion1, ListaCombinaciones),
    member(EstacionCombinacion2, ListaCombinaciones),
    member(EstacionCombinacion1, ListaEstaciones1),
    member(EstacionCombinacion2, ListaEstaciones2).

%******
% 3 - Viajes
%******

% Viajes
% Una agencia de viajes lleva un registro con todos los vuelos que maneja de la siguiente manera:
% vuelo(Codigo de vuelo, capacidad en toneladas, [lista de destinos]).
% Esta lista de destinos está compuesta de la siguiente manera:
% escala(ciudad, tiempo de espera)
% tramo(tiempo en vuelo)
% Siempre se comienza de una ciudad (escala) y se termina en otra (no puede terminar en el aire al vuelo), con tiempo de vuelo entre medio de las ciudades. Considerar que los viajes son de ida y de vuelta por la misma ruta.

%Base de conocimientos
vuelo(arg845, 30, [escala(rosario,0), tramo(2), escala(buenosAires,0)]).

vuelo(mh101, 95, [escala(kualaLumpur,0), tramo(9), escala(capeTown,2),
tramo(15), escala(buenosAires,0)]).

vuelo(dlh470, 60, [escala(berlin,0), tramo(9), escala(washington,2), tramo(2), escala(nuevaYork,0)]).

vuelo(aal1803, 250, [escala(nuevaYork,0), tramo(1), escala(washington,2),
tramo(3), escala(ottawa,3), tramo(15), escala(londres,4), tramo(1),
escala(paris,0)]).

vuelo(ble849, 175, [escala(paris,0), tramo(2), escala(berlin,1), tramo(3),
escala(kiev,2), tramo(2), escala(moscu,4), tramo(5), escala(seul,2), tramo(3), escala(tokyo,0)]).

vuelo(npo556, 150, [escala(kiev,0), tramo(1), escala(moscu,3), tramo(5),
escala(nuevaDelhi,6), tramo(2), escala(hongKong,4), tramo(2), escala(shanghai,5), tramo(3), escala(tokyo,0)]).

vuelo(dsm3450, 75, [escala(santiagoDeChile,0), tramo(1), escala(buenosAires,2), tramo(7), escala(washington,4), tramo(15), escala(berlin,3), tramo(15), escala(tokyo,0)]).

% Definir los siguientes predicados; en todos vamos a identificar cada vuelo por su código.
% tiempoTotalVuelo/2 : Relaciona un vuelo con el tiempo que lleva en total, contando las esperas en las escalas (y eventualmente en el origen y/o destino) más el tiempo de vuelo.
% escalaAburrida/2 : Relaciona un vuelo con cada una de sus escalas aburridas; una escala es aburrida si hay que esperar mas de 3 horas.
% ciudadesAburridas/2 : Relaciona un vuelo con la lista de ciudades de sus escalas aburridas.
% vueloLargo/1: Si un vuelo pasa 10 o más horas en el aire, entonces es un vuelo largo. OJO que dice "en el aire", en este punto no hay que contar las esperas en tierra. 
%conectados/2: Relaciona 2 vuelos si tienen al menos una ciudad en común.
% bandaDeTres/3: Relaciona 3 vuelos si están conectados, el primero con el segundo, y el segundo con el tercero.
% distanciaEnEscalas/3: Relaciona dos ciudades que son escalas del mismo vuelo y la cantidad de escalas entre las mismas; si no hay escalas intermedias la distancia es 1. P.ej. París y Berlín están a distancia 1 (por el vuelo BLE849), Berlín y Seúl están a distancia 3 (por el mismo vuelo). No importa de qué vuelo, lo que tiene que pasar es que haya algún vuelo que tenga como escalas a ambas ciudades. Consejo: usar nth1.
% vueloLento/1: Un vuelo es lento si no es largo, y además cada escala es aburrida.

%Tiempo total de vuelo
tiempoTotalVuelo(CodigoVuelo, TiempoTotal):-
	vuelo(CodigoVuelo,_,Destinos),
	tiempoRecorridoTotal(Destinos,TiempoIda),
	TiempoTotal is TiempoIda*2.

tiempoRecorridoTotal([escala(_, Espera) | Resto], Total) :-
    tiempoRecorridoTotal(Resto, Parcial),
    Total is Espera + Parcial.
tiempoRecorridoTotal([tramo(TiempoVuelo) | Resto], Total) :-
    tiempoRecorridoTotal(Resto, Parcial),
    Total is TiempoVuelo + Parcial.

%Escala aburrida
escalaAburrida(CodigoVuelo,Ciudad):-
	vuelo(CodigoVuelo,_,Destinos),
	member(escala(Ciudad, Espera), Destinos),
	Espera >3.

%Ciudades aburridas
ciudadesAburridas(CodigoVuelo, Ciudades) :-
    findall(Ciudad,escalaAburrida(CodigoVuelo, Ciudad),Ciudades).

%Vuelo largo
vuelolargo(CodigoVuelo,TiempoVuelo):-	
	vuelo(CodigoVuelo,_,Destinos),
	sum_list(tramo(TiempoVuelo),TiempoVuelo).





	




	

	






	



	

	



