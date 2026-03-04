cariera(programator_software, it, tehnologie).
cariera(analist_date, it, analiza_date).
cariera(manager_proiect, management, business).
cariera(designer_grafic, design, media).
cariera(inginer_civil, inginerie, constructii).
cariera(medic, medicina, sanatate).
cariera(profesor, educatie, invatamant).
cariera(contabil, finante, bancar).
cariera(avocat, drept, juridic).
cariera(marketer_digital, marketing, publicitate)


% numara_comune(Lista1, Lista2, Rezultat)
numara_comune([], _, 0).
numara_comune([H|T], Lista2, Scor) :- member(H, Lista2), !, numara_comune(T, Lista2, S1), Scor is S1 + 1.
numara_comune([_|T], Lista2, Scor) :- numara_comune(T, Lista2, Scor).