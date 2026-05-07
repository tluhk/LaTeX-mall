# LaTeX-i seadistamine Windowsis — VS Code ja MiKTeX

**Autor:** Peeter Alliksaar

**Aasta:** 2026

---

## Sissejuhatus

See juhend õpetab samm-sammult, kuidas seadistada oma Windowsi arvutis töötav LaTeX-i keskkond. Juhendi lõpuks on sul installitud kõik vajalik ning saad hakata kirjaliku töö kallal tööd tegema.

**Mida installime?**

- **MiKTeX** — LaTeX-i mootor, mis genereerib PDF-i;
- **Strawberry Perl** — abiprogramm, mida MiKTeX vajab;
- **VS Code** — tekstiredaktor, kus kirjutad oma `.tex` faile;
- **LaTeX Workshop** — VS Code laiendus, mis lisab kompileerimise nupu ja eelvaate.

**Miks mitte lihtsalt Overleaf?**  
Overleaf on hea kiireks alustamiseks, kuid töötab ainult internetiühendusega. Lokaalne seadistus töötab alati, ka ilma internetita, ning on kiirem.

---

## Samm 1 — Installi MiKTeX

MiKTeX on LaTeX-i distributsioon Windowsile, mis sisaldab kõiki vajalikke pakette.

### Allalaadimine ja installimine

1. Ava brauser ja mine aadressile <https://miktex.org/download>.
2. Kliki nuppu **Download**.
3. Käivita allalaaditud `.exe` fail.
4. Installimise käigus vali järgmised seaded:

| Küsimus installis                   | Mida valida   |
| ----------------------------------- | ------------- |
| Install for                         | _Just for me_ |
| Install missing packages on-the-fly | _Yes_         |
| Preferred paper                     | A4            |

Installi lõpuks kliki **Start**.

### Kontrolli, et MiKTeX töötab

1. Vajuta klaviatuuril **Win + R**.
2. Kirjuta `cmd` ja vajuta Enter.
3. Avaneb käsurida. Kirjuta sinna:

```bash
pdflatex --version
```

Kui näed teksti, mis algab `MiKTeX-pdfTeX` ja versiooninumbriga, siis MiKTeX töötab.

Kui näed veateadet `command not found`, taaskäivita arvuti ja proovi uuesti.

---

## Samm 2 — Installi Strawberry Perl

Perl on vajalik tööriistale nimega `latexmk`, mis käivitab kompileerimise VS Code'is.

**Ilma Perlita ei tööta VS Code'i kompileerimise nupp.**

### Miks Perl on vajalik?

`latexmk` on skriptikeel, mida MiKTeX kasutab kompileerimise automatiseerimiseks. VS Code LaTeX Workshop kasutab vaikimisi `latexmk`-i, mis vajab omakorda Perli. Strawberry Perl on Windowsi versioon, mis on tasuta ja lihtne installida.

### Allalaadimine ja installimine

1. Mine aadressile <https://strawberryperl.com>.
2. Kliki **Strawberry Perl x.x.x.x (64bit)**.
3. Käivita allalaaditud `.msi` fail.
4. Installi vaikimisi seadetega:
   **Next → Next → Next → Install → Finish**
5. **Taaskäivita arvuti** pärast installimist.

### Kontrolli, et Perl töötab

Pärast taaskäivitust ava uuesti käsurida:

**Win + R → `cmd`**

Kirjuta:

```bash
perl --version
```

Kui ilmub tekst versiooninumbriga, on Perl edukalt installitud.

---

## Samm 3 — Installi VS Code

VS Code ehk Visual Studio Code on Microsofti tasuta tekstiredaktor, mis sobib hästi LaTeX-i kirjutamiseks.

### Allalaadimine ja installimine

1. Mine aadressile <https://code.visualstudio.com>.
2. Kliki **Download for Windows**.
3. Käivita allalaaditud `.exe` fail.
4. Installimisel märgi kindlasti järgmised valikud:

| Valik                                               | Mida teha                                       |
| --------------------------------------------------- | ----------------------------------------------- |
| Add to PATH                                         | **Märgi ära** — vajalik käsurealt käivitamiseks |
| Register Code as an editor for supported file types | Võid märkida                                    |
| Add “Open with Code” to context menu                | Mugav, soovituslik                              |

Kliki **Next → Install → Finish**.

---

## Samm 4 — Installi LaTeX Workshop laiendus

LaTeX Workshop on VS Code laiendus, mis lisab kompileerimise nupu, reaalajas PDF-i eelvaate ja süntaksi esiletõstmise.

### Laienduse installimine

1. Ava VS Code.
2. Kliki vasakul külgribal **Extensions** ikoonil.
3. Kirjuta otsingusse `LaTeX Workshop`.
4. Kliki esimese tulemuse kõrval **Install**.
5. Oota, kuni install lõpeb.

### Kontrolli laienduse seadet

Pärast installimist kontrollime, et kompilaatoriks on seatud `pdflatex` ja viited töötavad korrektselt.

1. Vajuta **Ctrl + Shift + P**.
2. Kirjuta `Open User Settings JSON` ja vajuta Enter.
3. Avaneb `settings.json` fail.
4. Lisa selle sisse järgmine kood olemasolevate ridade vahele:

```json
"latex-workshop.latex.autoClean.run": "onBuilt",
"latex-workshop.latex.clean.fileTypes": [
  "*.aux", "*.log", "*.toc", "*.out", "*.synctex.gz", "*.blg"
],
"latex-workshop.latex.tools": [
  {
    "name": "pdflatex",
    "command": "pdflatex",
    "args": [
      "-synctex=1",
      "-interaction=nonstopmode",
      "-halt-on-error",
      "-file-line-error",
      "%DOC%"
    ]
  },
  {
    "name": "bibtex",
    "command": "bibtex",
    "args": ["%DOCFILE%"]
  }
],
"latex-workshop.latex.recipes": [
  {
    "name": "pdflatex",
    "tools": ["pdflatex"]
  },
  {
    "name": "pdflatex -> bibtex -> pdflatex x2",
    "tools": ["pdflatex", "bibtex", "pdflatex", "pdflatex"]
  }
],
"latex-workshop.latex.recipe.default": "pdflatex -> bibtex -> pdflatex x2",
"latex-workshop.view.pdf.viewer": "tab"
```

**Tähtis:**  
Kui `settings.json` on tühi ehk seal on ainult `{}`, asenda kogu sisu järgmisega:

```json
{
  "latex-workshop.latex.autoClean.run": "onBuilt",
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux",
    "*.log",
    "*.toc",
    "*.out",
    "*.synctex.gz",
    "*.blg"
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-halt-on-error",
        "-file-line-error",
        "%DOC%"
      ]
    },
    {
      "name": "bibtex",
      "command": "bibtex",
      "args": ["%DOCFILE%"]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "pdflatex",
      "tools": ["pdflatex"]
    },
    {
      "name": "pdflatex -> bibtex -> pdflatex x2",
      "tools": ["pdflatex", "bibtex", "pdflatex", "pdflatex"]
    }
  ],
  "latex-workshop.latex.recipe.default": "pdflatex -> bibtex -> pdflatex x2",
  "latex-workshop.view.pdf.viewer": "tab"
}
```

### Märkused seadete kohta

- `autoClean` kustutab abifailid automaatselt pärast kompileerimist.
- `.bbl` faili ei kustutata, sest see on vajalik viidete jaoks.
- `-halt-on-error` peatab kompileerimise kohe vea korral.
- `recipe.default` on seatud käsule `pdflatex -> bibtex -> pdflatex x2`, mis tagab viidete korrektse töötamise.

Salvesta fail: **Ctrl + S**.

---

## Samm 5 — Projekti kausta loomine

Kõik kirjaliku töö failid peavad olema **samas kaustas**. Hea tava on luua selge kaustastruktuur.

### Kausta loomine

1. Ava File Explorer ehk Windowsi failihaldur.
2. Loo kaust sobivasse kohta, näiteks:

```text
C:\Kasutaja\Dokumendid\LoputooLatex
```

3. Kausta nimi ei tohiks sisaldada tühikuid ega täpitähti. Kasuta pigem sidekriipse või CamelCase-i.

### Vajalikud failid kaustas

Projekti kausta peavad kuuluma vähemalt järgmised failid:

| Fail                | Kirjeldus                            |
| ------------------- | ------------------------------------ |
| `tlu-hk-thesis.cls` | Kolledži nõuetele vastav mall        |
| `main.tex`          | Sinu peamine kirjutamise fail        |
| `allikad.bib`       | Allikate fail                        |
| `pildid/`           | Kaust pildifailide jaoks, valikuline |

### Kausta avamine VS Code'is

1. Ava VS Code.
2. Kliki **File → Open Folder**.
3. Vali oma loodud kaust ja kliki **Select Folder**.
4. Vasakul külgribal näed nüüd oma kausta sisu.

---

## Samm 6 — Esimese `.tex` faili loomine ja kompileerimine

### `main.tex` faili loomine

1. VS Code vasakul külgribal tee kaustal paremklõps.
2. Vali **New File**.
3. Nimeta fail `main.tex`.
4. Kopeeri faili sisse minimaalne LaTeX-i mall.

Näiteks:

```latex
\documentclass{tlu-hk-thesis}

\oppekava{Rakendusinformaatika õppekava}
\autor{Eesnimi Perekonnanimi}
\toopealkiri{Sinu töö pealkiri}
\tooyldnimetus{Rakenduskõrghariduse lõputöö}
\juhendajaandmed{Juhendaja Nimi, kraad}
\teisejuhendajaandmed{}
\aasta{2026}

\begin{document}

\maketitlepage
\tableofcontents

\unnumberedsection{Sissejuhatus}

Siia kirjuta sissejuhatuse tekst.

\section{Esimene peatükk}

Siia kirjuta esimese peatüki tekst.

\unnumberedsection{Kokkuvõte}

Siia kirjuta kokkuvõte.

\bibliography{allikad}

\end{document}
```

Salvesta fail: **Ctrl + S**.

### PDF-i kompileerimine

1. Vajuta **Ctrl + Alt + B**.
2. See käivitab kompileerimise.
3. VS Code alumisel ribal näed kompileerimise edenemist.
4. Kui kompileerimine õnnestus, avaneb PDF automaatselt paremal paneelil.
5. PDF-i saab avada ka käsitsi `.tex` faili paremas ülanurgas oleva raamatu ikooni kaudu.

### Kasulikud kiirklahvid VS Code'is

| Klahvikombinatsioon | Tegevus                            |
| ------------------- | ---------------------------------- |
| Ctrl + Alt + B      | Kompileeri PDF                     |
| Ctrl + Alt + V      | Ava PDF-i eelvaade                 |
| Ctrl + S            | Salvesta fail                      |
| Ctrl + Z            | Võta tagasi                        |
| Ctrl + /            | Kommenteeri või eemalda kommentaar |

### Kust leida veateadet?

Kui kompileerimine ebaõnnestub, näitab VS Code veateadet.

1. Kliki VS Code alumisel ribal punast **X** ikooni.
2. Või ava **View → Output**.
3. Vali rippmenüüst **LaTeX Workshop**.
4. Sealt näed täpset veateadet.

Veateadet tasub otsida internetist, sest LaTeX-i veateated on hästi dokumenteeritud.

---

## Kokkuvõte

Pärast kõigi sammude läbimist on sinu arvutis:

- MiKTeX installitud ja töötav;
- Strawberry Perl installitud;
- VS Code installitud koos LaTeX Workshop laiendusega;
- projekti kaust loodud korrektse struktuuriga;
- esimene `.tex` fail kompileeritud PDF-iks.

Nüüd saad hakata kirjalikku tööd kirjutama. Kasuta `LaTeX_juhend_HK.tex` faili, kus on kirjas kõik vajalikud käsklused peatükkide, tabelite, piltide ja allikate lisamiseks.
