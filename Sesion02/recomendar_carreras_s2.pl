:- dynamic habilidad/1.
:- dynamic interes/1.
:- dynamic personalidad/1.
:- dynamic condicion/1.

% Base de conocimiento

carrera(ingenieria_sistemas) :-
    habilidad(matematicas), interes(tecnologia), personalidad(analitico).

carrera(ingenieria_industrial) :-
    habilidad(matematicas), interes(tecnologia), condicion(trabajo_en_equipo).

carrera(ingenieria_civil) :-
    habilidad(matematicas), interes(construccion), personalidad(meticuloso).

carrera(medicina) :-
    habilidad(biologia), interes(salud), personalidad(empatico).

carrera(psicologia) :-
    interes(salud), personalidad(empatico), condicion(interaccion_social).

carrera(derecho) :-
    habilidad(argumentacion), interes(justicia), personalidad(pensamiento_critico).

carrera(arquitectura) :-
    habilidad(creatividad), interes(diseño), personalidad(meticuloso).

carrera(diseno_grafico) :-
    habilidad(creatividad), interes(diseño), condicion(autonomia).

carrera(administracion_empresas) :-
    habilidad(liderazgo), interes(negocios), condicion(trabajo_en_equipo).

carrera(marketing) :-
    habilidad(creatividad), interes(negocios), condicion(interaccion_social).

carrera(economia) :-
    habilidad(matematicas), interes(negocios), personalidad(analitico).

carrera(contabilidad) :-
    habilidad(matematicas), interes(negocios), personalidad(meticuloso).

carrera(biologia) :-
    habilidad(biologia), interes(investigacion), personalidad(analitico).

carrera(fisica) :-
    habilidad(matematicas), interes(investigacion), personalidad(pensamiento_critico).

carrera(quimica) :-
    habilidad(biologia), interes(investigacion), personalidad(meticuloso).

carrera(educacion) :-
    interes(educacion), personalidad(empatico), condicion(interaccion_social).

carrera(turismo) :-
    interes(cultura), personalidad(extrovertido), condicion(interaccion_social).

carrera(relaciones_internacionales) :-
    habilidad(argumentacion), interes(cultura), condicion(interaccion_social).

% Nombre legible de cada carrera

nombre(ingenieria_sistemas,       'Ingenieria de Sistemas').
nombre(ingenieria_industrial,     'Ingenieria Industrial').
nombre(ingenieria_civil,          'Ingenieria Civil').
nombre(medicina,                  'Medicina').
nombre(psicologia,                'Psicologia').
nombre(derecho,                   'Derecho').
nombre(arquitectura,              'Arquitectura').
nombre(diseno_grafico,            'Diseno Grafico').
nombre(administracion_empresas,   'Administracion de Empresas').
nombre(marketing,                 'Marketing').
nombre(economia,                  'Economia').
nombre(contabilidad,              'Contabilidad').
nombre(biologia,                  'Biologia').
nombre(fisica,                    'Fisica').
nombre(quimica,                   'Quimica').
nombre(educacion,                 'Educacion').
nombre(turismo,                   'Turismo').
nombre(relaciones_internacionales,'Relaciones Internacionales').

% Preguntas interactivas (para SWI-Prolog escritorio)

preguntar_habilidad(Pregunta, Clave) :-
    format('~w (s/n): ', [Pregunta]), read(R),
    ( R == s -> assertz(habilidad(Clave)) ; true ).

preguntar_interes(Pregunta, Clave) :-
    format('~w (s/n): ', [Pregunta]), read(R),
    ( R == s -> assertz(interes(Clave)) ; true ).

preguntar_personalidad(Pregunta, Clave) :-
    format('~w (s/n): ', [Pregunta]), read(R),
    ( R == s -> assertz(personalidad(Clave)) ; true ).

preguntar_condicion(Pregunta, Clave) :-
    format('~w (s/n): ', [Pregunta]), read(R),
    ( R == s -> assertz(condicion(Clave)) ; true ).

recolectar :-
    nl, write('-- Habilidades --'), nl,
    preguntar_habilidad('Matematicas', matematicas),
    preguntar_habilidad('Argumentacion', argumentacion),
    preguntar_habilidad('Creatividad', creatividad),
    preguntar_habilidad('Liderazgo', liderazgo),
    preguntar_habilidad('Biologia', biologia),
    nl, write('-- Intereses --'), nl,
    preguntar_interes('Tecnologia', tecnologia),
    preguntar_interes('Salud', salud),
    preguntar_interes('Negocios', negocios),
    preguntar_interes('Diseno', diseno),
    preguntar_interes('Investigacion', investigacion),
    preguntar_interes('Educacion', educacion),
    preguntar_interes('Justicia', justicia),
    preguntar_interes('Cultura', cultura),
    preguntar_interes('Construccion', construccion),
    nl, write('-- Personalidad --'), nl,
    preguntar_personalidad('Analitico', analitico),
    preguntar_personalidad('Empatico', empatico),
    preguntar_personalidad('Extrovertido', extrovertido),
    preguntar_personalidad('Meticuloso', meticuloso),
    preguntar_personalidad('Pensamiento critico', pensamiento_critico),
    nl, write('-- Condiciones laborales --'), nl,
    preguntar_condicion('Trabajo en equipo', trabajo_en_equipo),
    preguntar_condicion('Autonomia', autonomia),
    preguntar_condicion('Interaccion social', interaccion_social).

% Mostrar resultados

mostrar :-
    findall(C, carrera(C), Lista),
    ( Lista \= []
    -> nl, write('Carreras recomendadas:'), nl,
       forall(member(C, Lista), (nombre(C, N), write(' >> '), write(N), nl))
    ;  write('Sin coincidencias. Intenta con mas opciones.')
    ), nl.

% Limpiar perfil

limpiar :-
    retractall(habilidad(_)), retractall(interes(_)),
    retractall(personalidad(_)), retractall(condicion(_)).

% Punto de entrada interactivo (SWI-Prolog escritorio)

iniciar :-
    limpiar,
    nl, write('=== Sistema de Recomendacion de Carreras ==='), nl,
    write('Responde con s. o n. (con punto al final)'), nl,
    recolectar,
    mostrar.

% Consulta directa (para SWISH online)
% Ejemplo: consultar([matematicas], [tecnologia], [analitico], []).

consultar(Habs, Ints, Pers, Conds) :-
    limpiar,
    forall(member(H, Habs), assertz(habilidad(H))),
    forall(member(I, Ints),  assertz(interes(I))),
    forall(member(P, Pers),  assertz(personalidad(P))),
    forall(member(C, Conds), assertz(condicion(C))),
    mostrar.
