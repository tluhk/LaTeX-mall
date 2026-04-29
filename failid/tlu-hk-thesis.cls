% tlu-hk-thesis.cls

% Paberi alged nõuded
\LoadClass[12pt,a4paper,oneside]{article}
% Vajalik rõhumärkide ja sidekriipsude tarbeks
\RequirePackage[T1]{fontenc}
\RequirePackage[estonian]{babel}
% Kasutab UTF-8 kodeeringut
\RequirePackage[utf8]{inputenc}
% Times New Roman font
\RequirePackage{newtxtext,newtxmath}

% Tiitelleht

% Tiitellehe muutujad
\newcommand{\toopealkiri}[1]{\def\@toopealkiri{#1}}
\newcommand{\tooyldnimetus}[1]{\def\@tooyldnimetus{#1}}
\newcommand{\aasta}[1]{\def\@aasta{#1}}
\newcommand{\autor}[1]{\def\@autor{#1}}
\newcommand{\juhendajaandmed}[1]{\def\@juhendajaandmed{#1}}
\newcommand{\teisejuhendajaandmed}[1]{\def\@teisejuhendajaandmed{#1}}
\newcommand{\oppekava}[1]{\def\@oppekava{#1}}

% Vaikeväärtused
\toopealkiri{Töö pealkiri}
\tooyldnimetus{Töö üldnimetus}
\aasta{2026}
\autor{ees- ja perekonnanimi}
\juhendajaandmed{Juhendaja nimi}
\teisejuhendajaandmed{}
\oppekava{Õppekava nimetus}

% Tiitellehe loomise käsk

\newcommand{\maketitlepage}{
  \thispagestyle{empty}
  \begin{center}
    {\MakeUppercase{TALLINNA ÜLIKOOL}}\\[12pt]
    Haapsalu kolledž\\[12pt]
    \@oppekava\\
    \vspace{12em}
    {\@autor}\\
    \vspace{2em}
    {\fontsize{14pt}{16.8pt}\selectfont \MakeUppercase{\@toopealkiri}}\\
    \vspace{1em}
    {\@tooyldnimetus}\\
    \vfill
    \begin{flushright}
    Juhendaja: \@juhendajaandmed
    \end{flushright}  
    
    \begin{flushright}
    \@teisejuhendajaandmed
    \end{flushright}

    \vfill
    Haapsalu \@aasta
  \end{center}
  \newpage
  \setcounter{page}{1}  % Ei loe tiitellehte leheküljenumbrina 
}

% Lehekülje kujundus

% Reasamm 1,5
\RequirePackage{setspace}
\onehalfspacing

% Lehe servadest jäetakse vasakule ja paremale 2,5 cm vaba ruumi (margins)
% Ülemine ja alumine veeris (margin) on 3,25 cm või enam

\RequirePackage{geometry}
\geometry{
  left=2.5cm,
  right=2.5cm,
  top=3.25cm,
  bottom=3.25cm,
  headsep=1cm,  % vaba ruum päise ja põhiosa vahel
  footskip=1cm  % vaba ruum jaluse ja põhiosa vahel
}

% Lõigu alguses ei kasutata taandrida
\setlength{\parindent}{0pt}

% Lõiguvahe 12 pt peale lõiku
\setlength{\parskip}{12pt}

% Päis ja jalus
\RequirePackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}
\setlength{\headheight}{20pt}

% Päis: vasakul pealkiri ja töö liik, paremal aasta, mis on samal real töö üldnimetusega
\fancyhead[L]{
  \fontsize{10pt}{10pt}\selectfont
  \begin{tabular}[t]{@{}l@{}}
    \@toopealkiri \\
    \@tooyldnimetus
  \end{tabular}
}
\fancyhead[R]{
  \fontsize{10pt}{10pt}\selectfont
  \begin{tabular}[t]{@{}l@{}}
    \@ \\
    \@aasta
  \end{tabular}
}
\renewcommand{\headrulewidth}{0.4pt}

% Jalus: vasakul õppeasutus ja autor, paremal leheküljenumber
\fancyfoot[L]{
  \begin{tabular}[t]{@{}l@{}}
    \fontsize{10pt}{10pt}\selectfont Tallinna Ülikooli Haapsalu kolledž \\
    \fontsize{10pt}{10pt}\selectfont \@autor
  \end{tabular}
}
\fancyfoot[R]{\fontsize{10pt}{10pt}\selectfont \thepage}
\renewcommand{\footrulewidth}{0.4pt}

% Pealkirjad

% nimeta Table of Contents ümber Sisukorraks
  \renewcommand{\contentsname}{Sisukord}

% Chapterid kasutavad päiseid ja jaluseid. Vajalik sisukorra lehe jaoks, sest sisukord on olemuselt Chapter.
\makeatletter
\let\ps@plain\ps@fancy
\makeatother

% Sections ehk pealkirjade lõpus numbrite paika saamine.
\renewcommand\thesection{\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection.\arabic{subsubsection}}

% Luba subsubsection numbreid, ilma selleta ei ole neil numbreid.
\setcounter{secnumdepth}{3}  % Numberdab kuni subsubsection
\setcounter{tocdepth}{3}     % Näitab sisukorras kuni subsubsection

% Sectionide muutmise pakett
\RequirePackage{titlesec}

% Uue sectioni ehk pealkirja panemisel alustatakse uuelt leheküljelt
\newcommand{\sectionbreak}{\clearpage}

% Pealkiri suurem, bold, suurte tähtedega, numbri lõpus punkt
\titleformat{\section}
  {\normalfont\large\bfseries\MakeUppercase}{\thesection.}  {0.33em}{}

% Peatüki ning alapeatüki pealkirja ja sellele järgneva teksti vahele jäetakse 12 p vahe
% {left}{before}{after}
\titlespacing*{\section}{0pt}{0pt}{12pt}

% Alapealkiri 
\titleformat{\subsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsection.}
  {0.33em}
  {}

% Alaalapealkiri 
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries}
  {\thesubsubsection.}
  {0.33em}
  {}

% Alapealkirja ning eelneva teksti vahele jäetakse 24 p vahe.
% {left}{before}{after}
\titlespacing*{\subsection}{0pt}{24pt}{12pt}  

% Numbrita pealkiri, mis kuvatakse sisukorras
\newcommand{\unnumberedsection}[1]{
  \section*{#1}
  \phantomsection % Vajalik selleks et {hyperref} pakett saaks linkida sisukorras nummerdamata pealkirja viitamise
  \addcontentsline{toc}{section}{#1}
}

% Sisukorra numbrite vorming
\RequirePackage{tocloft}

% Lisab punkti pealkirja numbri järele sisukorras
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecaftersnum}{.}

% Lisab punktiirjoone esimese astme pealkirjadele

% Punktiirjoon sectionitele
\renewcommand{\cftsecdotsep}{\cftdotsep}

% Kõik sisukorra read samas stiilis, normal font, bold effectid eemaldatud.
\renewcommand{\cftsecfont}{\normalfont}
\renewcommand{\cftsecpagefont}{\normalfont}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

% Hüperlingid sisukorras ja dokumendis
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=black,
  urlcolor=black,
  citecolor=black,
}

% 1,5-kordne reasamm tuleb juba eelnevalt defineeritud \onehalfspacing käsust.

% Loetelude seadistamine
\RequirePackage{enumitem}

% Nummerdatud loetelu - araabia numbrid ümarsulgudega
\setlist[enumerate,1]{label=\arabic*), itemsep=0pt, parsep=0pt, topsep=6pt}

% Tähistatud loetelu - kriipsud
\setlist[itemize,1]{label=--, itemsep=0pt, parsep=0pt, topsep=6pt}

% Alamtaseme loetelu - väiketähed ümarsulgudega
\setlist[enumerate,2]{label=\alph*), itemsep=0pt, parsep=0pt}

% Alamtaseme tähistatud loetelu - punktid
\setlist[itemize,2]{label=$\bullet$, itemsep=0pt, parsep=0pt}


% Tabelite seadistamine vastavalt nõetele
\RequirePackage{caption}
\RequirePackage{float}  % Võimaldab [H] parameetrit

% Tabeli pealkirja vorming
\DeclareCaptionFormat{tablecaption}{#1#2#3}
\captionsetup[table]{
  format=tablecaption,
  labelsep=period,           % punkt numbri järel
  labelfont=normal,          % tavaline font
  textfont=normal,           % tavaline font
  justification=raggedright, % joondus vasakule
  singlelinecheck=false,     % ka üherealine pealdis vasakule
  skip=6pt,                  % vahe pealdise ja tabeli vahel
  position=above             % pealdis tabeli kohal
}

% Muuda "Table" -> "Tabel"
\renewcommand{\tablename}{Tabel}

% Tabelid jäävad alati täpselt sinna, kuhu need kirjutatakse
\makeatletter
\renewenvironment{table}[1][H]{
  \@float{table}[#1]
}{
  \end@float
}
\makeatother

\RequirePackage{longtable}
\RequirePackage{booktabs} % valikuline, ilusate joonte jaoks

\captionsetup[longtable]{
  format=tablecaption,
  labelsep=period,
  labelfont=normal,
  textfont=normal,
  justification=raggedright,
  singlelinecheck=false,
  skip=6pt,
  position=above
}





% Joonised

\RequirePackage{graphicx}

% Muudab ära "Figure" teksti ära "Joonis"-ks.
\renewcommand{\figurename}{Joonis}

% pealdis joonise all, vasakule joondatud
% tavaline font
% "Joonis X." formaat koos punktiga
\captionsetup[figure]{
  font=normal,
  labelfont=normal,
  labelsep=period,
  justification=raggedright,
  singlelinecheck=false,
  position=below,
  skip=6pt
}

% Joonised jäävad alati täpselt sinna, kuhu need kirjutatakse
\makeatletter
\renewenvironment{figure}[1][H]{
  \@float{figure}[#1]
}{
  \end@float
}
\makeatother

% Kasutus: \joonis{failinimi}{Pealdise tekst}
% Näide:   \joonis{joonis1.png}{Joonise kirjeldus (Allikas, 2024)}

\newcommand{\joonis}[2]{
  \begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{#1}
    \caption{#2}
  \end{figure}
}

% Kui on vaja "Joonis" asemel kasutada sõna "Foto"
% Kasutus: \foto{failinimi}{Pealdise tekst}
\newcounter{foto}
\newcommand{\foto}[2]{
  \refstepcounter{foto}
  \begin{figure}[H]
    \centering
    \includegraphics[width=0.8\textwidth]{#1}
    \captionsetup{labelformat=empty}
    \caption{Foto \thefoto. #2}
  \end{figure}
}


% Koodinäited (

%fvextra pakett toetab UTF-8
\RequirePackage{fvextra}

% Koodinäidete nummerdamise loendur
\newcounter{koodinaide}

\DefineVerbatimEnvironment{koodinaide}{Verbatim}{
  fontsize=\small,
  breaklines=true,
  breaksymbolleft={},
}

% Pealkiri koodi alla, automaatne nummerdamine
\newcommand{\koodipealkiri}[1]{
  \refstepcounter{koodinaide}
  \noindent Koodinäide \thekoodinaide. #1\par
  \vspace{6pt}
}


% Viitamine (APA 7)

% Kasutus .tex failis:
%   Tekstisisene viide:            \citep{Karu2018}
%   Viide leheküljenumbriga:       \citep[lk.~18]{Janes2014}
%   Viide leheküljevahemikuga:     \citep[lk.~24--26]{Kukk2015}
%   Mitu allikat korraga:          \citep{Janes2000,Karu1999}
%   Autor tekstis, aasta sulgudes: \citet{Janes2000}

%   Allikate loetelu lõpus:        \bibliography{allikad}
\RequirePackage{xurl}

\RequirePackage[round, authoryear]{natbib}

% Nimeta "References" ümber "ALLIKAD" ja lisa sisukorras
\addto\captionsestonian{\renewcommand{\refname}{Allikad}}
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
  \oldbibliography{#1}
  \phantomsection
  \addcontentsline{toc}{section}{Allikad}
}

\bibliographystyle{apalike}
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=black,
  urlcolor=black,
  citecolor=black,
}