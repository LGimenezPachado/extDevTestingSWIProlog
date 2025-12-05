%punto 1%
trabajaEn(kyle, ventas).
trabajaEn(trisha, ventas).
trabajaEn(joshua, ventas).
trabajaEn(sherri, logistica).
trabajaEn(ian, logistica).

asalariado(kyle,6,50).
asalariado(sherri,7,60).
asalariado(gus,8,60).
jefe(ian, [kyle,rob,ginger], 40).
jefe(trisha, [ian,gus],90).
independiente(joshua,arquitecto,55).

sueldoPromedio(6,45).
sueldoPromedio(7,60).
sueldoPromedio(8,80).

%punto 2%
ganaBien(Persona):-
    asalariado(Persona,Horas,Sueldo),
    sueldoPromedio(Horas,SueldoPromedio),
    Sueldo > SueldoPromedio.

ganaBien(Persona):-
    jefe(Persona,Empleados,Sueldo),
    length(Empleados, Cantidad),
    Sueldo >20*Cantidad.

ganaBien(Persona):-
    independiente(Persona,arquitecto,_).

ganaBien(Persona):-
    independiente(Persona,Oficio,Sueldo),
    Oficio \= arquitecto,
    Sueldo >70.

esPaganini(Departamento):-
    trabajaEn(_,Departamento),
    forall(
        trabajaEn(Persona, Departamento),
        ganaBien(Persona)
    ).

%punto 3%
leGustaTrabajarEn(kyle, ventas).
leGustaTrabajarEn(kyle, logistica).
leGustaTrabajarEn(trisha, ventas).
leGustaTrabajarEn(joshua, ventas).
leGustaTrabajarEn(sherri, contabilidad).
leGustaTrabajarEn(sherri, facturacion).
leGustaTrabajarEn(sherri, cobranzas).

estaEnProblemas(Departamento):-
    trabajaEn(Persona, Departamento),
    leGustaTrabajarEn(Persona, Departamento).

%punto 4%

sueldo(Persona, Sueldo) :- asalariado(Persona, _, Sueldo).
sueldo(Persona, Sueldo) :- jefe(Persona, _, Sueldo).
sueldo(Persona, Sueldo) :- independiente(Persona, _, Sueldo).

persona(Persona):-sueldo(Persona,_).



	
	
	
    
    
    




    
    
    
    
    




    










