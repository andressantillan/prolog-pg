/**
    Representar cada sentencia como una sola cláusula en Prolog:
    1. Carlos estudia “Paradigmas y Lenguajes”
    2. La población de Argentina es de 45 millones de personas.
    3. Italia es un país europeo.
    4. Julia es alta.
    5. 2 es un número primo
    6. Los porteños son de CABA
    7. Alguien escribió “Hamlet”
    8. Todos los humanos son mortales
    9. Todas las personas respiran.
    10. Juan lleva paraguas si llueve.
    11. Si te portás mal no vas a tener postre.
    12. Los bomberos tienen más de 1,8 m. de altura.
**/

estudia(carlos, paradigmas).

poblacion(argentina, 45000000).

pertenece(italia, europa).
es_europeo(Pais) :- pertenece(Pais, europa).

es_alta(julia).

es_numero_primo(2).

vive_en(caba, julia).
es_portenio(P) :- vive_en(caba, P).

escribio(alguien, Hamlet).

humano(pedro).
humano(andres).
humano(juan).
humano(matias).
es_mortal(H) :- humano(H).

persona(facundo).
persona(pepe).
persona(franco).
persona(juan).
respira(P) :- persona(P).

tiempo(hoy, llueve).
lleva_paraguas(Persona) :- tiempo(hoy, llueve).

comportamiento(juan, malo).
comportamiento(pedro, bueno).
no_tiene_postre(Persona) :- comportamiento(Persona, malo).

altura(rodrigo, 185).
altura(juan, 169).
es_bombero(Persona) :- altura(Persona, SuAltura), SuAltura > 180.