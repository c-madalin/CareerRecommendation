cariera(programator_software,it,tehnologie).
cariera(analist_date,it,analiza_date).
cariera(manager_proiect,management,business).
cariera(designer_grafic,design,media).
cariera(inginer_civil, inginerie,constructii).
cariera(medic,medicina,sanatate).
cariera(profesor,educatie, invatamant).
cariera(contabil,finante,bancar).
cariera(avocat,drept,juridic).
cariera(marketer_digital,marketing,publicitate)% abilitati(Cariera, ListaAbilitati)
abilitati(programator_software,[programare,logica,python,java,sql]).
abilitati(analist_date,[statistica,analiza_date,python,r,excel]).
abilitati(manager_proiect,[leadership,planificare,comunicare,negociere]).
abilitati(designer_grafic,[creativitate,photoshop,ilustratie,estetica]).
abilitati(inginer_civil,[matematica,fizica,autocad,proiectare]).
abilitati(medic,[biologie,diagnostic,empatie,rezistenta_stres]).
abilitati(profesor,[pedagogie,rabdare,comunicare,prezentare]).
abilitati(contabil,[calcul,atentie_detalii,fiscalitate,excel]).
abilitati(avocat,[argumentare,oratorie,drept_civil,cercetare]).
abilitati(marketer_digital,[creativitate,seo,social_media,copywriting]).

% numara_comune(Lista1, Lista2, Rezultat)
numara_comune([],_,0).
numara_comune([H|T],Lista2,Scor) :-
	member(H,Lista2),
	!,
	numara_comune(T,Lista2,S1),
	Scor is S1 + 1.
numara_comune([_|T],Lista2,Scor) :-
	numara_comune(T,Lista2,Scor).

	% recomanda(AbilitatiUtilizator, IntereseUtilizator, Recomandari)
recomanda(AU, IU, R) :- findall(S-C, (cariera(C,,), abilitati(C,AC), interese(C,IC), calcul_match(AU,AC,MA), calcul_match(IU,IC,MI), calcul_scor(MA,MI,S)), R).