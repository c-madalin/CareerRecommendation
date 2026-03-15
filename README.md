# Sistem Expert - Recomandare Carieră (Tema 6 PLF)

Acest proiect este un **Sistem Expert** dezvoltat în limbajul **Prolog**, conceput pentru a recomanda cariere utilizatorilor pe baza unui algoritm de potrivire. Sistemul analizează abilitățile și interesele utilizatorului, le compară cu cerințele a 10 cariere distincte și generează un top ierarhizat folosind un sistem de scor ponderat.

##  Echipa și Contribuții (Progres pe parcurs)


* **Mădălin Cazan** - *Baza de Date (Knowledge Base)*
  * A definit structura bazei de cunoștințe și faptele sistemului.
  * A creat minim 10 cariere detaliate, incluzând faptele: `cariera/3`, `abilitati/2`, `interese/2`, `educatie/2` și `salariu/2`.

* **Ștefan Bălănică** - *Logica de Potrivire (Matching Engine)*
  * A dezvoltat logica de căutare a elementelor comune între liste (`numara_comune/3`).
  * A implementat funcția de calculare a gradului de potrivire procentual (`calcul_procent/3`), necesară pentru algoritmul de ierarhizare.

* **Tudor Pîrău** - *Sistemul de Scor și Ierarhizarea*
  * A implementat formula matematică din barem (`calcul_scor/3`): *0.6 x Abilități + 0.4 x Interese*.
  * A dezvoltat predicatul principal de calcul și sortare (`recomanda_scor/3` și `recomanda/3`), care folosește `findall`, `keysort` și `reverse` pentru a genera topul final al carierelor.

* **Cătălin Buta** - *Interfața cu Utilizatorul și Filtrarea*
  * A creat interfața de afișare formatată a rezultatelor (`afiseaza_recomandari/1`).
  * A gestionat cazurile speciale (ex. afișarea unui mesaj de eroare când nu se găsesc potriviri).
  * A implementat funcționalitatea de filtrare suplimentară, cum ar fi recomandările stricte pe un anumit domeniu (`recomanda_filtru_domeniu/3`).

##  Cum funcționează algoritmul?

1. **Input:** Utilizatorul introduce două liste: una cu abilitățile pe care le deține și alta cu interesele sale.
2. **Procesare:** Sistemul calculează ce procent din cerințele fiecărui job este acoperit de utilizator.
3. **Scoring:** Se aplică ponderile (60% pentru abilități, 40% pentru interese).
4. **Output:** Carierele cu un scor > 0 sunt sortate descrescător și afișate în consolă.

##  Cum se rulează proiectul

1. Asigurați-vă că aveți **SWI-Prolog** instalat.
2. Deschideți terminalul sau interfața grafică SWI-Prolog.
3. Încărcați fișierul principal:
   `?- consult('proiect.pl').`

##  Exemple de Interogări (Testare)

**1. Recomandare generală (Testarea ierarhizării):**
`?- recomanda_scor([programare, python, logica], [tehnologie, rezolvare_probleme], Rezultate).`

**2. Recomandare cu filtrare pe domeniu (Ex. IT) și afișare prietenoasă:**
`?- recomanda_filtru_domeniu([statistica, python], [cifre, tehnologie], it).`

**3. Testarea cazului fără potrivire:**
`?- afiseaza_recomandari([]).`