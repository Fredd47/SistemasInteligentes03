horoscopo(acuario, 21, 1, 19, 2).
horoscopo(piscis, 20, 2, 20, 3).
horoscopo(aries, 21, 3, 20, 4).
horoscopo(tauro, 21, 4, 20, 5).
horoscopo(geminis, 21, 5, 20, 6).
horoscopo(cancer, 21, 6, 22, 7).
horoscopo(leo, 23, 7, 22, 8).
horoscopo(virgo, 23, 8, 22, 9).
horoscopo(libra, 23, 9, 22, 10).
horoscopo(escorpio, 23, 10, 21, 11).
horoscopo(sagitario, 22, 11, 21, 12).
horoscopo(capricornio, 22, 12, 20, 1).

/*Reglas*/
signo(D,M,acuario) :- (M=1, D>=21);(M=2, D=<19).
signo(D,M,piscis) :- (M=2, D>=20);(M=3, D=<20).
signo(D,M,aries) :- (M=3, D>=21);(M=4, D=<20).
signo(D,M,tauro) :- (M=4, D>=21);(M=5, D=<20).
signo(D,M,geminis) :- (M=5, D>=21);(M=6, D=<20).
signo(D,M,cancer) :- (M=6, D>=21);(M=7, D=<22).
signo(D,M,leo) :- (M=7, D>=23);(M=8, D=<22).
signo(D,M,virgo) :- (M=8, D>=23);(M=9, D=<22).
signo(D,M,libra) :- (M=9, D>=23);(M=10, D=<22).
signo(D,M,escorpio) :- (M=10, D>=23);(M=11, D=<21).
signo(D,M,sagitario) :- (M=11, D>=22);(M=12, D=<21).
signo(D,M,capricornio) :- (M=12, D>=22);(M=1, D=<20).