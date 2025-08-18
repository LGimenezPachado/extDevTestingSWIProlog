% --- Base de conocimientos ---
alumno(julieta,	corregido([f, f, v, f, v, f, f, v, f, f], 7)).
alumno(ramiro,	corregido([f, v, v, v, f, v, f, v, v, v], 5)).
alumno(milagros,corregido([f, v, v, v, f, f, f, v, f, v], 3)).
alumno(bruno,	corregido([v, v, f, v, f, f, v, f, f, v], 1)).
alumno(paula,	corregido([f, v, f, f, f, v, f, v, f, v], 6)).
alumno(leandro,	corregido([f, v, f, v, v, f, f, f, f, v], 4)).
alumno(noel,    sinCorregir([f, f, v, v, v, f, f, v, v, v])).

respuestaValida(v).
respuestaValida(f).

% --- Punto 1 ---
% Relaciona alumno con sus respuestas
respuestasDe(Alumno, Lista) :-
    alumno(Alumno, corregido(Lista,_)).
respuestasDe(Alumno, Lista) :-
    alumno(Alumno, sinCorregir(Lista)).

% --- Punto 2 ---
% Lista de 10 elementos y todas respuestas válidas
respuestasBienFormadas(Lista) :-
    is_list(Lista),
    length(Lista, 10),
    forall(member(R,Lista), respuestaValida(R)).

% --- Punto 3 ---
% Puntaje comparando respuestas del alumno vs correctas
puntaje([], [], 0).
puntaje([R|Rs], [R|Cs], N) :-
    puntaje(Rs, Cs, N1),
    N is N1 + 1.
puntaje([R|Rs], [C|Cs], N) :-
    R \= C,
    puntaje(Rs, Cs, N).

% --- Punto 4 ---
% Corrige un examen según una lista de correctas
correctorAutomatico(RespuestasCorrectas, Alumno, Nota) :-
    respuestasDe(Alumno, RespuestasAlumno),
    puntaje(RespuestasAlumno, RespuestasCorrectas, Nota).

% --- Punto 5 ---
% Una solución posible son respuestas que producen
% los puntajes ya corregidos
posibleSolucion(RespuestasCorrectas) :-
    respuestasBienFormadas(RespuestasCorrectas),
    forall(alumno(Alumno, corregido(Respuestas, Nota)),
        (puntaje(Respuestas, RespuestasCorrectas, Nota))).

% --- Punto 6 ---
% Nota mínima y máxima que podría tener un alumno
rangoDeNotas(Alumno, Min, Max) :-
    setof(Nota,
        (posibleSolucion(Sol), correctorAutomatico(Sol, Alumno, Nota)),
        Notas),
    min_list(Notas, Min),
    max_list(Notas, Max).

% --- Punto 7 ---
% Nota final: fija si ya está corregido,
% promedio del rango si no
nota(Alumno, Nota) :-
    alumno(Alumno, corregido(_, Nota)).

nota(Alumno, NotaProm) :-
    alumno(Alumno, sinCorregir(_)),
    rangoDeNotas(Alumno, Min, Max),
    NotaProm is (Min + Max) / 2.

% --- Punto 8 ---
% Lista de alumnos con lista de sus notas
correccionCompleta(Alumnos, Notas) :-
    maplist(nota, Alumnos, Notas).
