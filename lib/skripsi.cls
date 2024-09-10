% To Do
% perbaiki jarak setelah figure dengan subsubsection
% perbaiki jarak setelah table dengan subsubsection
% buat header table center tapi isinya rata kiri
% beberapa salah referensi di daftar isi

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lib/skripsi}
\LoadClass[a4paper, 12pt]{report}


%===========================================================
% Require Package
\RequirePackage{pdfpages}
\RequirePackage{longtable}
\RequirePackage{ifthen}
\RequirePackage{siunitx}
\sisetup{round-mode=places, round-precision=4}
\RequirePackage{listings}
\lstdefinestyle{customc}{
  belowcaptionskip=1\baselineskip,
  breaklines=true,
  frame=single,
  xleftmargin=0pt,
  language=Python,
  showstringspaces=false,
  basicstyle=\ttfamily\small, % Courier font
}
%-----------------------------------------------------------
\RequirePackage[a4paper, top=4cm, left=4cm, right=3cm, bottom=3cm]{geometry}
\setlength{\headheight}{15pt}
\setlength{\footskip}{1.5cm}         % distance between text and foot
\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-\topmargin}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-4cm}   % bottom margin
% to add indent for first paragraph
\RequirePackage{indentfirst}
\parindent 3.0em

\RequirePackage{microtype}

% to justify
\RequirePackage{ragged2e}

% Prevent hyphenating the words
\usepackage[none]{hyphenat}
\sloppy

% Times New Roman Font like
\RequirePackage{newtxtext, newtxmath}

% to use or import image
\RequirePackage{graphicx}
\RequirePackage[export]{adjustbox}

% to use color in table
\RequirePackage[table]{xcolor}

% use CSV to generate table
\usepackage{csvsimple}

% to set space of paragraph line
\RequirePackage{setspace}
\onehalfspacing

% to customize Table of contents
\RequirePackage{tocloft}

% to customize footer and header
\RequirePackage{fancyhdr}

% to hide Hyperlink color
\RequirePackage[pdftex,bookmarks=true,hidelinks]{hyperref}

% Counter for figure, table and equation
\RequirePackage{chngcntr}

% Setup the caption of figure, table and equation
\RequirePackage[font=small, labelfont={it},textfont={it}, justification=centering]{caption}

% Setup label of enumerate item
\RequirePackage{enumitem} 
% \renewcommand{\theenumi}{\Alph{enumi}}

% use Watermark
%\RequirePackage[pages=some]{background}

% use listings for code script
\RequirePackage{listings}
\RequirePackage{color}

% float [H]
\RequirePackage{float}
%-----------------------------------------------------------
% End Require Package
%===========================================================

\renewcommand{\baselinestretch}{1.42}
\renewcommand{\UrlFont}{\small\rm}

\newcommand{\listappendicesname}{DAFTAR LAMPIRAN}
\newlistof{appendices}{apc}{\listappendicesname}
\newcommand{\appendices}[1]{\addcontentsline{apc}{appendices}{#1}}
\newcommand{\newappendix}[1]{\section{#1}\appendices{#1}}

%===========================================================
% Package Daftar Pustaka, bentuk citasi
% Config
% - style, citestyle = {authoryear, numeric, apa, mla}
% - sorting {year,name,title} = ynt
%-----------------------------------------------------------
\usepackage[
    backend=biber,
    style=authoryear,
    citestyle=authoryear-comp,
    sorting=nty,
    giveninits=false,
    maxbibnames=3
    ]{biblatex}
\addbibresource{bibtex/daftar-pustaka.bib}

\AtEveryBibitem{%
  \clearfield{note}%
}

% Redefine the bibliography entry format to remove numbering
\DeclareFieldFormat{labelnumberwidth}{}
% new citation style
\let\oldcitate\cite
\newcommand*\thecite[1]{\hyperlink{cite.\therefsection @#1}{(\citeauthor*{#1}, \citeyear{#1})}}
\renewcommand*\cite[1]{\hyperlink{cite.\therefsection @#1}{(\citeauthor*{#1}, \citeyear{#1})}}
% \newcommand*\thecite[1]{(\cite{#1})}
%-----------------------------------------------------------
% End Biblatex Config
%===========================================================


%===========================================================
% Setting footer, header and page number
%-----------------------------------------------------------
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{ %style for chapter page
    \fancyhf{} % clear all header and footer fields
    \fancyfoot[C]{\thepage}
    % \renewcommand{\headrulewidth}{0pt}
    % \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{empty}{ %style for cover
    \fancyhf{}
    % \renewcommand{\headrulewidth}{0pt}
    % \renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{theheader}{ %style for header
    \fancyhead[R]{Universitas Gunadarma}
}
%-----------------------------------------------------------
% End Setting footer, header and page number
%===========================================================


%===========================================================
% Code Script, Listing
%-----------------------------------------------------------
\definecolor{light-gray}{gray}{0.95}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstdefinestyle{python}{
    language=Python,
    emptylines=1,
    backgroundcolor=\color{light-gray},
    rulecolor=\color{light-gray},
    xleftmargin=1cm,
    framexleftmargin=1cm,
    columns=flexible,
    basicstyle={\small\ttfamily},
    breaklines=true,
    breakatwhitespace=true,
    showstringspaces=false,
    tabsize=2,
    moredelim=**[is][\color{red}]{@}{@},
    keywordstyle=\color{blue},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
}

\lstdefinestyle{shell}{
    language=bash,
    emptylines=1,
    backgroundcolor=\color{black},
    rulecolor=\color{black},
    columns=flexible,
    basicstyle={\small\ttfamily\color{white}},
    breaklines=true,
    breakatwhitespace=true,
    showstringspaces=false,
    tabsize=2,
    moredelim=**[is][\color{red}]{@}{@},
    keywordstyle=\color{blue},
    commentstyle=\color{dkgreen},
    stringstyle=\color{mauve},
}

\lstdefinestyle{plain}{
    emptylines=1,
    backgroundcolor=\color{light-gray},
    rulecolor=\color{light-gray},
    columns=flexible,
    basicstyle={\footnotesize\ttfamily\color{black}},
    breaklines=true,
    breakatwhitespace=true,
    tabsize=2
}
%-----------------------------------------------------------
% End Code Script, Listing
%===========================================================


%===========================================================
% Redefition Terms
%-----------------------------------------------------------
\def\prefacename{PRAKATA}
\def\contentsname{DAFTAR ISI}
\def\listfigurename{DAFTAR GAMBAR}
\def\listtablename{DAFTAR TABEL}
\def\listappendixname{DAFTAR LAMPIRAN}
\def\nomenclaturename{DAFTAR LAMBANG DAN SINGKATAN}
% \def\abstractname{INTISARI}
\def\partname{BAGIAN}
\def\chaptername{BAB}
\def\appendixname{LAMPIRAN}
\def\refname{DAFTAR PUSTAKA}
\def\bibname{DAFTAR PUSTAKA}
\def\indexname{Indek}
\def\figurename{Gambar}
\def\tablename{Tabel}
\def\pagename{Halaman}
%-----------------------------------------------------------
% End Redefinition Terms
%===========================================================

%===========================================================
% Redefine chapter and sections
%-----------------------------------------------------------
% \setcounter{secnumdepth}{2}
% \renewcommand \thepart {\@Roman \c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand \thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
\renewcommand \thesubsubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection.\@arabic\c@subsubsection}
\renewcommand{\@makechapterhead}[1]{%
    {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 0\p@
    \fi
        \interlinepenalty\@M
        \large \bfseries #1\par\nobreak
        \vskip 15\p@
    }
}
\renewcommand{\section}{
    \@startsection {section}{1}{\z@}
        {-3.3ex \@plus -1ex \@minus -.2ex}
        {2.1ex \@plus.2ex}
        {\normalfont\normalsize\bfseries}
}
\renewcommand{\subsection}{
    \@startsection{subsection}{2}{\z@}
        {-3.25ex\@plus -1ex \@minus -.2ex}
        {1.5ex \@plus .2ex}
        {\normalfont\normalsize\bfseries}
}
\renewcommand{\subsubsection}{
    \@startsection{subsubsection}{2}{\z@}
        {-3.25ex\@plus -1ex \@minus -.2ex}
        {1.5ex \@plus .2ex}
        {\normalfont\normalsize\bfseries}
}
\renewcommand{\@makeschapterhead}[1]{%
    {\parindent \z@ \centering \normalfont
    \large\bfseries #1
    \par\nobreak
    \vskip 20\p@}
}
%-----------------------------------------------------------
% End Redefine chapter and sections
%===========================================================


%===========================================================
% Setting Tabble of Content, list of figure, list of table
%-----------------------------------------------------------
% customize Table of contents
\renewcommand{\cftchappresnum}{BAB }
\renewcommand{\cftchapnumwidth}{3.7em}
\renewcommand{\cftchapdotsep}{\cftdotsep}
% table of contents
\renewcommand{\cftbeforetoctitleskip}{-0.25cm}
\renewcommand{\cftaftertoctitleskip}{0.75cm}
\renewcommand\cfttoctitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftaftertoctitle{\hfill\mbox{}}
% list of figures
\renewcommand{\cftbeforeloftitleskip}{-0.25cm}
\renewcommand{\cftafterloftitleskip}{0.75cm}
\renewcommand\cftloftitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftafterloftitle{\hfill\mbox{}}
% list of tables
\renewcommand{\cftbeforelottitleskip}{-0.25cm}
\renewcommand{\cftafterlottitleskip}{0.75cm}
\renewcommand\cftlottitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftafterlottitle{\hfill\mbox{}}
% list of appendix
\renewcommand{\cftbeforeapctitleskip}{-0.25cm}
\renewcommand{\cftafterapctitleskip}{0.75cm}
\renewcommand\cftapctitlefont{\hfill\Large\bfseries\MakeUppercase}
\renewcommand\cftafterapctitle{\hfill\mbox{}}
%-----------------------------------------------------------
% End Setting Tabble of Content, list of figure, list of table
%===========================================================


%===========================================================
% Set Counter for figure, table, and equation
%-----------------------------------------------------------
\counterwithin{figure}{chapter}
\counterwithin{table}{chapter}
\counterwithin{equation}{chapter}
%\@addtoreset {figure}{section}
%\renewcommand \thefigure {
%    \ifnum \c@section>\z@ 
%        .\@arabic\c@figure
%    \fi 
%        \@arabic\c@chapter.\@arabic\c@figure}
\renewcommand \thefigure {\@arabic\c@chapter.\@arabic\c@figure}
\renewcommand \thetable {\@arabic\c@chapter.\@arabic\c@table}
\renewcommand \theequation {\@arabic\c@chapter.\@arabic\c@equation}
%-----------------------------------------------------------
% End Set Counter for figure, table, and equation
%===========================================================

%===========================================================
% Set Table, Figure Environment
%-----------------------------------------------------------
% new environment for Figure
\newenvironment{afigure}
    {\begin{figure}[ht]}
    {\end{figure}}

% new environment for Table
\newenvironment{atable}
    {\begin{table}[ht] \renewcommand{\arraystretch}{1.3} \centering \small}
    {\end{table}}

% new environment for longtable
% \newenvironment{alongtable}
%     {\begin{longtable}{| c | c | c | c | c | c | c | c |} \renewcommand{\arraystretch}{1.5} }
%     {\end{longtable}}
%-----------------------------------------------------------
% End Set Table, Figure Environment
%===========================================================
