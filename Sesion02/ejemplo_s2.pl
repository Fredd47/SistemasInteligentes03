/*sumar_numeros :-
    write("Introduce primer numero: "),
    read(Num1),
    
    write("Introduce segundo numero: "),
    read(Num2),
    
    Suma is Num1 + Num2,
    
    write("La suma es: "),
    write(Suma).*/

clasificar_numero(X, Clasificacion) :-
    X > 0 -> Clasificacion = positivo;
    X < 0 -> Clasificacion = negativo;
    Clasificacion = cero.