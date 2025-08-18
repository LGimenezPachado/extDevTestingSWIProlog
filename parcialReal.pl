alumno(julieta,	    corregido([f, f, v, f, v, f, f, v, f, f], 7)).
alumno(ramiro,	    corregido([f, v, v, v, f, v, f, v, v, v], 5)).
alumno(milagros,	corregido([f, v, v, v, f, f, f, v, f, v], 3)).
alumno(bruno,	    corregido([v, v, f, v, f, f, v, f, f, v], 1)).
alumno(paula,	    corregido([f, v, f, f, f, v, f, v, f, v], 6)).
alumno(leandro,	    corregido([f, v, f, v, v, f, f, f, f, v], 4)).
alumno(noel,        sinCorregir([f, f, v, v, v, f, f, v, v, v])).
respuestaValida(v).
respuestaValida(f).

% Punto 1
respuestasDe(Alumno, ListaRespuestas):-
alumno(Alumno, corregido(ListaRespuestas,_)).

respuestasDe(Alumno, ListaRespuestas):-
alumno(Alumno, sinCorregir(ListaRespuestas)).

% Punto 2
respuestasBienFormadas(ListaRespuestas):-
    respuestasDe(_,ListaRespuestas),
    length(ListaRespuestas, 10),
    forall(ListaRespuestas, respuestaValida).

% Punto 3
puntaje(ListaRespuestas, ListaRespuestasCorrectas,NotaExamen):-
    respuestasDe(alumno,ListaRespuestas),
    forall(ListaRespuestasCorrectas,respuestaValida(v)).


% Punto 4
correctorAutomatico(ListaRespuestasCorrectas,Alumno,NotaExamen):-

% Punto 5
posibleSolucion(RespuestasBienFormadas):-


% Punto 6
rangoDeNotas(Alumno,NotaMAasBaja,NotaMasAlta):-
    alumno(Alumno,ListaRespuestas).

% Punto 7
nota(Alumno,Puntaje):-
    alumno(Alumno,corregido(_,Puntaje)).

nota(Alumno,PuntajeNoel):-
    alumno(Alumno,sinCorregir(listarespuestasNoel,puntajeNoel)),
    length(puntajeNoel,'v'),
    sum_list(listarespuestasNoel, PuntajeNoel).
    
    

% Punto 8
%correcionCompleta(ListaAlumnos,ListaNotas):-