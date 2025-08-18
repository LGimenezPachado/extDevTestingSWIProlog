:- include(parcial).

% --- Tests para examenDe/2 ---
:- begin_tests(respuestasDe).

test(noel, [nondet]) :-
    respuestasDe(noel, [f, f, v, v, v, f, f, v, v, v]).
test(julieta, [nondet]) :-
    respuestasDe(julieta, [f, f, v, f, v, f, f, v, f, f]).
test(alumno_inexistente, [fail]) :-
    respuestasDe(pancracio, _).

:- end_tests(respuestasDe).

% --- Tests para examenBienFormado/1 ---
:- begin_tests(examenBienFormado).

test(valido) :-
    respuestasBienFormadas([v, v, v, v, v, f, f, f, f, f]).
test(largo_incorrecto, [fail]) :-
    respuestasBienFormadas([v, v, v, v, v, f, f, f, f]).
test(respuesta_invalida, [fail]) :-
    respuestasBienFormadas([v, v, v, v, v, f, f, f, f, x]).

:- end_tests(examenBienFormado).

% --- Tests para puntaje/3 ---
:- begin_tests(puntaje).

test(totalmente_correcto, [nondet]) :-
    puntaje([v, v, v], [v, v, v], 3).
test(parcialmente_correcto, [nondet]) :-
    puntaje([v, f, v], [v, v, v], 2).
test(totalmente_incorrecto, [nondet]) :-
    puntaje([f, f, f], [v, v, v], 0).
test(con_listas_vacias) :-
    puntaje([], [], 0).

:- end_tests(puntaje).

% --- Tests para correctorAutomatico/3 ---
:- begin_tests(correctorAutomatico).

test(noel_con_respuestas_conocidas, [nondet]) :-
    correctorAutomatico([f, v, v, v, f, f, f, v, f, v], noel, 7).
test(julieta_con_otras_respuestas, [nondet]) :-
    correctorAutomatico([f, f, v, f, v, f, f, v, f, f], julieta, 10).
test(ramiro_con_otras_respuestas, [nondet]) :-
    correctorAutomatico([f, f, v, f, v, f, f, v, f, f], ramiro, 4).

:- end_tests(correctorAutomatico).

% --- Tests para posibleSolucion/1 ---
:- begin_tests(posibleSolucion).

test(solucion_valida) :-
    posibleSolucion([f, f, f, f, v, v, f, v, v, f]).
test(invalida_ejemplo, [fail]) :-
    posibleSolucion([v, v, v, v, v, v, v, v, v, v]).

:- end_tests(posibleSolucion).

% --- Tests para rangoDeNotas/3 ---
:- begin_tests(rangoDeNotas).

test(rangoNoel) :-
    rangoDeNotas(noel, 6, 6).
test(rangoJulieta) :-
    rangoDeNotas(julieta, 7, 7).
test(rangoRamiro) :-
    rangoDeNotas(ramiro, 5, 5).
test(rangoMilagros) :-
    rangoDeNotas(milagros, 3, 3).

:- end_tests(rangoDeNotas).

% --- Tests para correccionCompleta/2 ---
:- begin_tests(correccionCompleta).

test(alumnos, [nondet]) :-
    correccionCompleta([noel, julieta, ramiro, milagros], Notas),
    Notas = [6, 7, 5, 3].
test(lista_vacia) :-
    correccionCompleta([], []).

:- end_tests(correccionCompleta).


% --- Tests para nota/2 ---
:- begin_tests(nota).

test(notaNoel, [nondet]) :-
    nota(noel, 6).
test(notaJulieta, [nondet]) :-
    nota(julieta, 7).
test(notaRamiro, [nondet]) :-
    nota(ramiro, 5).
test(notaMilagros, [nondet]) :-
    nota(milagros, 3).

:- end_tests(nota).

% Para ejecutar todos los tests
:- run_tests(respuestasDe).
:- run_tests(examenBienFormado).
:- run_tests(puntaje).
:- run_tests(correctorAutomatico).
:- run_tests(posibleSolucion).
:- run_tests(rangoDeNotas).
:- run_tests(correccionCompleta).
:- run_tests(nota).

% --- Tests para nota/2 de rigoberto ---
abolish(alumno, 2).
abolish(rangoDeNotas, 3).
:- discontiguous rangoDeNotas/3.
rangoDeNotas(rigoberto, 2, 10).
:- discontiguous alumno/2.
alumno(rigoberto, sinCorregir([X, X, X, X, X, X, X, X, X, X])).

:- begin_tests(notaRigoberto).
test(notaRigoberto, [nondet]) :-
    nota(rigoberto, 6).
:- end_tests(notaRigoberto).

:- run_tests(notaRigoberto).
