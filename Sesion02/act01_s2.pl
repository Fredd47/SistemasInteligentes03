/*1er Grado*/
padre(jesus, fredd).
padre(jesus, carlo).
padre(ernesto, jesus).
padre(ernesto,iris).
padre(pedro,olivia).
padre(pedro,adela).
padre(juan,ernesto). /*paterno*/
padre(briceño,fabricio).

madre(olivia, fredd).
madre(olivia, carlo).
madre(durbia,jesus).
madre(durbia,iris).
madre(margarita,olivia).
madre(margarita,adela).
madre(silvana,margarita). /*materno*/
madre(adela,fabricio).

suegro(ernesto,olivia).
suegro(margarita,jesus).

/*2do Grado*/
abuelo(ernesto, fredd).
abuelo(ernesto, carlo).
abuelo(pedro, fredd).
abuelo(pedro, carlo).
abuela(margarita, fredd).
abuela(margarita, carlo).
abuela(durbia, fredd).
abuela(durbia, carlo).

/*3er Grado*/
bisabuelo(juan,fredd).
bisabuelo(juan,carlo).
bisabuela(silvana,fredd).
bisabuela(silvana,carlo).

tios(adela,fredd).
tios(adela,carlo).
tios(briceño,fredd).
tios(briceño,carlo).
tios(iris,fredd).
tios(iris,carlo).

/*4to Grado*/
primos(fabricio,fredd).
primos(fabricio,carlo).

hermano(X,Y) :- padre(P,X), padre(P,Y), X\=Y.