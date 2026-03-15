% --- 1. BAZA DE CUNOSTINTE ---
% cariera(Nume, Domeniu, Industrie)
cariera(programator_software, it, tehnologie).
cariera(analist_date, it, analiza_date).
cariera(manager_proiect, management, business).
cariera(designer_grafic, design, media).
cariera(inginer_civil, inginerie, constructii).
cariera(medic, medicina, sanatate).
cariera(profesor, educatie, invatamant).
cariera(contabil, finante, bancar).
cariera(avocat, drept, juridic).
cariera(marketer_digital, marketing, publicitate).

% abilitati(Cariera, ListaAbilitati)
abilitati(programator_software, [programare, logica, python, java, sql]).
abilitati(analist_date, [statistica, analiza_date, python, r, excel]).
abilitati(manager_proiect, [leadership, planificare, comunicare, negociere]).
abilitati(designer_grafic, [creativitate, photoshop, ilustratie, estetica]).
abilitati(inginer_civil, [matematica, fizica, autocad, proiectare]).
abilitati(medic, [biologie, diagnostic, empatie, rezistenta_stres]).
abilitati(profesor, [pedagogie, rabdare, comunicare, prezentare]).
abilitati(contabil, [calcul, atentie_detalii, fiscalitate, excel]).
abilitati(avocat, [argumentare, oratorie, drept_civil, cercetare]).
abilitati(marketer_digital, [creativitate, seo, social_media, copywriting]).

% interese(Cariera, ListaInterese)
interese(programator_software, [tehnologie, inovatie, logica, calculatoare, rezolvare_probleme]).
interese(analist_date, [cifre, statistica, tendinte, tehnologie, organizare]).
interese(manager_proiect, [organizare, coordonare, afaceri, eficienta, strategie]).
interese(designer_grafic, [arta, estetica, vizual, creativitate, inovatie]).
interese(inginer_civil, [constructii, infrastructura, design_tehnic, fizica_aplicata]).
interese(medic, [sanatate, stiinta, ajutorare, biologie_umana, medicina]).
interese(profesor, [educatie, invatare, tineri, dezvoltare_personala, mentorat]).
interese(contabil, [finante, cifre, exactitate, economie, organizare_financiara]).
interese(avocat, [dreptate, lege, societate, argumentare, dezbateri]).
interese(marketer_digital, [online, tendinte, social_media, comunicare, publicitate]).

% educatie(Cariera, NivelStudii)
educatie(programator_software, licenta).
educatie(analist_date, master).
educatie(manager_proiect, master).
educatie(designer_grafic, licenta).
educatie(inginer_civil, licenta).
educatie(medic, doctorat).
educatie(profesor, licenta).
educatie(contabil, licenta).
educatie(avocat, master).
educatie(marketer_digital, licenta).

% salariu(Cariera, IntervalSalarial)
salariu(programator_software, [5000, 15000]).
salariu(analist_date, [6000, 14000]).
salariu(manager_proiect, [8000, 18000]).
salariu(designer_grafic, [4000, 10000]).
salariu(inginer_civil, [5000, 12000]).
salariu(medic, [7000, 20000]).
salariu(profesor, [4000, 8000]).
salariu(contabil, [4500, 11000]).
salariu(avocat, [6000, 25000]).
salariu(marketer_digital, [4000, 12000]).

% --- 2. REGULI DE POTRIVIRE ---

% numara_comune(Lista1, Lista2, Rezultat)
numara_comune([], _, 0).
numara_comune([H|T], Lista2, Scor) :-
    member(H, Lista2),
    !,
    numara_comune(T, Lista2, S1),
    Scor is S1 + 1.
numara_comune([_|T], Lista2, Scor) :-
    numara_comune(T, Lista2, Scor).

% Calcularea gradului de potrivire (procentual)
calcul_procent(ListaU, ListaCariera, Procent) :-
    numara_comune(ListaU, ListaCariera, NumarComune),
    length(ListaCariera, Total),
    Total > 0,
    Procent is NumarComune / Total.


% --- 3. SISTEM DE SCOR SI IERARHIZARE ---

% Sistem de recomandare cu Formula de Scor ponderat si Ierarhizare
recomanda_scor(AU, IU, RecomandariSortate) :-
    findall(Scor - C,
        (cariera(C, _, _),
         abilitati(C, AC),
         interese(C, IC),
         calcul_procent(AU, AC, MatchA),
         calcul_procent(IU, IC, MatchI),
         Scor is (0.6 * MatchA) + (0.4 * MatchI),
         Scor > 0),
        RezultateNesortate),
    
    % Ierarhizarea recomandarilor 
    keysort(RezultateNesortate, SortateCrescator),
    reverse(SortateCrescator, RecomandariSortate).


% --- 4. INTERFATA CU UTILIZATORUL ---

% Predicatul principal pentru lansarea recomandarii standard
start_recomandare(AU, IU) :-
    recomanda_scor(AU, IU, Rezultate),
    write('=== TOP RECOMANDARI PENTRU TINE ==='), nl,
    afiseaza_recomandari(Rezultate).

% Tratarea cazului in care nu exista potriviri
afiseaza_recomandari([]) :-
    write('Nu am gasit nicio cariera potrivita pentru profilul tau. Mai incearca!'), nl.
% Afisarea formatata a listei
afiseaza_recomandari([Scor-Nume|T]) :-
    format('Scor: ~2f | Cariera: ~w~n', [Scor, Nume]),
    afiseaza_recomandari(T).

% Filtrare dupa criterii suplimentare (Domeniu)
recomanda_filtru_domeniu(AU, IU, DomeniuCautat) :-
    recomanda_scor(AU, IU, ToateRecomandarile),
    findall(S - C,
        (member(S - C, ToateRecomandarile),
         cariera(C, DomeniuCautat, _)),
        RecomandariFiltrate),
    write('--- RECOMANDARI IN DOMENIUL: '), write(DomeniuCautat), write(' ---'), nl,
    afiseaza_recomandari(RecomandariFiltrate).