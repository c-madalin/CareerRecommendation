cariera(programator_software,it,tehnologie).
cariera(analist_date,it,analiza_date).
cariera(manager_proiect,management,business).
cariera(designer_grafic,design,media).
cariera(inginer_civil, inginerie,constructii).
cariera(medic,medicina,sanatate).
cariera(profesor,educatie, invatamant).
cariera(contabil,finante,bancar).
cariera(avocat,drept,juridic).
cariera(marketer_digital,marketing,publicitate).

% abilitati(Cariera, ListaAbilitati)
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

% interese(Cariera, ListaInterese)
interese(programator_software,[tehnologie, inovatie,logica,calculatoare,rezolvare_probleme]).
interese(analist_date,[cifre,statistica,tendinte,tehnologie,organizare]).
interese(manager_proiect,[organizare,coordonare,afaceri,eficienta,strategie]).
interese(designer_grafic,[arta,estetica,vizual,creativitate, inovatie]).
interese(inginer_civil,[constructii, infrastructura,design_tehnic,fizica_aplicata]).
interese(medic,[sanatate,stiinta,ajutorare,biologie_umana,medicina]).
interese(profesor,[educatie,invatare,tineri,dezvoltare_personala,mentorat]).
interese(contabil,[finante,cifre,exactitate,economie,organizare_financiara]).
interese(avocat,[dreptate,lege,societate,argumentare,dezbateri]).
interese(marketer_digital,[online,tendinte,social_media,comunicare,publicitate]).

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
recomanda(AU,IU,R) :-
	findall(S - C,
		(cariera(C,_,_),
			abilitati(C,AC),
			 interese(C,IC),
			numara_comune(AU,AC,MA),
			numara_comune(IU,IC,MI),
			S is MA + MI,
			S > 0),
		R).

% Interfata cu utilizatorul si tratarea cazului fara potrivire
afiseaza_recomandari([]) :-
    write('Nu am gasit nicio cariera potrivita pentru profilul tau. Mai incearca!'), nl.
afiseaza_recomandari([Scor-Nume|T]) :-
    format('Scor: ~2f | Cariera: ~w~n', [Scor, Nume]),
    afiseaza_recomandari(T).

% Posibilitatea de filtrare dupa criterii suplimentare (ex: dupa Domeniu)
recomanda_filtru_domeniu(AU, IU, DomeniuCautat) :-
    recomanda_scor(AU, IU, ToateRecomandarile),
    findall(S-C, (member(S-C, ToateRecomandarile), cariera(C, DomeniuCautat, _)), RecomandariFiltrate),
    write('--- RECOMANDARI IN DOMENIUL: '), write(DomeniuCautat), write(' ---'), nl,
    afiseaza_recomandari(RecomandariFiltrate).