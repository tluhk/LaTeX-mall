# TLÜ Haapsalu kolledži LaTeX-i mall

LaTeX-i mall Tallinna Ülikooli Haapsalu kolledži kirjalike tööde vormistamiseks.

## Failid

| Fail                | Kirjeldus                                                        |
| ------------------- | ---------------------------------------------------------------- |
| `tlu-hk-thesis.cls` | Klassifail, mis määrab töö vormistuse — **ära muuda seda faili** |
| `main.tex`          | Sinu tööfail — siin kirjutad oma töö sisu                        |
| `allikad.bib`       | Allikate fail BibTeX formaadis                                   |

---

## Alustamine Overleafiga (soovituslik)

Overleaf on veebipõhine LaTeX-i keskkond, mis töötab otse brauseris — midagi installida ei ole vaja.

1. Ava [overleaf.com](https://www.overleaf.com) ja logi sisse või loo uus konto
2. Loo uus tühi projekt — vali **Blank Project**
3. Kustuta Overleafi poolt automaatselt lisatud `main.tex`
4. Laadi üles repositooriumist alla tõmmatud failid: `main.tex`, `tlu-hk-thesis.cls`, `allikad.bib`
5. Soovitav on luua ka tühi kaust nimega `pildid`, kuhu lisada töös kasutatavad pildifailid
6. Kontrolli, et `main.tex` esimene rida on `\documentclass{tlu-hk-thesis}`
7. Vajuta **Recompile** — peaks ilmuma korrektselt vormindatud PDF

> Kui sisukord, viited või leheküljenumbrid ei uuene, vajuta **Recompile** veel üks või kaks korda. LaTeX vajab mõnikord mitut kompileerimist, et kõik õigesti uueneks.

---

## Tiitellehe täitmine

Muuda `main.tex` faili alguses olevad muutujad oma andmeteks:

```latex
\oppekava{Rakendusinformaatika õppekava}
\autor{Eesnimi Perekonnanimi}
\toopealkiri{Sinu töö pealkiri}
\tooyldnimetus{Rakenduskõrghariduse lõputöö}
\juhendajaandmed{Juhendaja Nimi, kraad}
\teisejuhendajaandmed{}   % Kui teist juhendajat pole, jäta tühjaks
\aasta{2026}
```

---

## Põhikäsklused

### Pealkirjad

```latex
\section{Esimese tasandi pealkiri}
\subsection{Teise tasandi pealkiri}
\subsubsection{Kolmanda tasandi pealkiri}
\unnumberedsection{Sissejuhatus}   % Nummerdamata pealkiri (sissejuhatus, kokkuvõte jne)
```

### Viitamine

```latex
\citep{võtmesõna}            % (Autor, 2024)
\cite{võtmesõna}             % Autor (2024)
\citep[lk.~18]{võtmesõna}   % (Autor, 2024, lk. 18)
\citep{allikas1,allikas2}    % (Autor1, 2024; Autor2, 2023)
```

### Pildid

```latex
\joonis{pildid/joonis1.png}{Joonise pealdis (Allikas, 2024)}
\foto{pildid/foto1.jpg}{Foto pealdis (Allikas, 2024)}
```

### Tabelid ja koodinäited

Tabelite koostamiseks soovitame kasutada veebipõhist generaatorit: [tablesgenerator.com](https://www.tablesgenerator.com/)

```latex
% Koodinäide
\begin{koodinaide}
const app = express();
\end{koodinaide}
\koodipealkiri{server.js — Express.js serveri näide}
```

---

## Juhendid

- 📄 **[LaTeXi malli kasutusjuhend](LaTeXi_malli_kasutusjuhend.pdf)** — põhijuhend malli kasutamiseks Overleafis
- 📄 **[VS Code ja MiKTeX seadistusjuhend](vscode_miktex_juhend.pdf)** — samm-sammuline juhend lokaalse töökeskkonna loomiseks Windowsis

---

Mall on loodud Tallinna Ülikooli Haapsalu kolledži kirjalike tööde vormistusnõuete põhjal.
