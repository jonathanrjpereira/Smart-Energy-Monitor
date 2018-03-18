% crceitthesis.cls
% LaTeX Style file for the Mumbai University Thesis Format
%   by Vaibhav Godbole 04/07/2014
%
%
% Many commands copied from withesis.cls from 
% http://www.ctan.org/tex-archive/macros/latex/contrib/withesis/
%
% 
%=============================================================================
% Licensed under the Perl Artistic License.
% see: http://www.ctan.org/tex-archive/help/Catalogue/licenses.artistic.html
% for more info...
%=============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{crceitthesis}[2014/07/04 IIT Bombay Thesis Format]
\typeout{Document Class `crceitthesis' v1 <04 July 14>}


%=============================================================================
% TBD: We need options to switch between Annual Progress Report,
%      Presynopsis, Synopsis and final thesis, and between different
%      types of reports. 
%=============================================================================
%\DeclareOption{aps}{}
%\DeclareOption{presynopsis}{}
%\DeclareOption{synopsis}{}
%\DeclareOption{thesis}{}
%\DeclareOption{dissertation}{}
%\DeclareOption{project}{}

%=============================================================================
% Pass the options to report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Defaults ...
\ProcessOptions

%=============================================================================
% a4paper: thesis must be printed on a4 size paper. 
% 12pt:    font size must be 12 pt
%
% As crceitthesis class is a simple extension of report class, we simply
% pass default options to report class.
% =============================================================================
\PassOptionsToClass{11pt,a4paper}{report}
\LoadClass{report}

% who is advisor?
\def\@advisorname{None}
\newcommand{\setguide}[1]{\def\@advisorname{#1}}

% and coadvisor? (initialized to empty)
\global\let\@coadvisorname\@empty
\newcommand{\setcoguide}[1]{\def\@coadvisorname{#1}}
\let\coguide\setcoguide %
\newcommand{\show@coguide}{\@coadvisorname}

% and exadvisor? (initialized to empty)
\global\let\@exadvisorname\@empty
\newcommand{\setexguide}[1]{\def\@exadvisorname{#1}}
\let\exguide\setexguide %
\newcommand{\show@exguide}{\@exadvisorname}

%=============================================================================
% TITLE PAGE
%   - define \title{} \author{} \date{}
%   - The default degree is ``Unknown Degree''
%     Degree can be changed using the command \mudegree{}
%   - The default department is ``Unknown Department''
%     The department can be changed using the command \department{}
%   - The default document type is ``A preliminary report''
%     The document type can be changed using the command \reporttype{}
%     There are some short-cuts for \reporttype{}:
%      * for a PhD thesis, specify \thesis
%      * for a M.Tech./M.Phil./M.Des./M.S. dissertation, specify \dissertation
%      * for a DIIT/B.Tech./M.Sc.project report, specify \project
%      * for a preliminary report, specify \prelim
%   - once the above are defined, use \maketitle to generate the titlepage
%=============================================================================
\newcommand\@thesistitlemedskip{0.25in}
\newcommand\@thesistitlebigskip{0.6in}
\newcommand{\rollnuma}[1]{\gdef\@rollnuma{#1}}
\newcommand{\rollnumb}[1]{\gdef\@rollnumb{#1}}
\newcommand{\rollnumc}[1]{\gdef\@rollnumc{#1}}
%\newcommand{\rollnumd}[1]{\gdef\@rollnumd{#1}}
\newcommand{\stua}[1]{\gdef\@stua{#1}}
\newcommand{\stub}[1]{\gdef\@stub{#1}}
\newcommand{\stuc}[1]{\gdef\@stuc{#1}}
%\newcommand{\stud}[1]{\gdef\@stud{#1}}

\newcommand{\mudegree}[1]{\gdef\@mudegree{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\reporttype}[1]{\gdef\@doctype{#1}}
\newcommand{\approvaltype}[1]{\gdef\@approvaltype{#1}}

\newcommand{\thesis}{\reporttype{thesis}\approvaltype{Thesis}}
\newcommand{\dissertation}{\reporttype{dissertation}\approvaltype{Dissertation}}
\newcommand{\project}{\reporttype{project report}\approvaltype{Project Report}}
\newcommand{\prelim}{\reporttype{preliminary report}\approvaltype{Report}}

\newcommand{\projecttitle}{\@title}

\gdef\@rollnum{Unknown 00000000}    % Default is Unknown 00000000
\gdef\@mudegree{Unknown Degree}    % Default is Unknown Degree
\gdef\@doctype{preliminary report}  % Default is a preliminary report
\gdef\@department{(Unknown Department)} % Default is Unknown

\renewcommand{\maketitle}{%
  \begin{titlepage}
%-----------------------------------------------------------------------------
% -- The thesis office doesn't like thanks on title page.  Put it in
% -- the acknowledgments.  This is here so you don't have to change
% -- your titlepage when converting from report style. -> from Purdue, but I
%        left it here since it seems compatible with UW-Madison, Eric -
%    Amey - I also left it here as IITB does not say anything about it.
%-----------------------------------------------------------------------------
    \def\thanks##1{\typeout{Warning: `thanks' deleted from thesis titlepage.}}
    \let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
    \vspace*{0.1in}
    \begin{center}
      \mbox{}\\
      %\vspace{-2cm}
      {\bf\expandafter\uppercase\expandafter{\LARGE\@title}} \\[\@thesistitlebigskip]
      {\large A \@doctype\ submitted in partial fulfillment of} \\
      {\large the requirements for the degree of}\\[\@thesistitlemedskip]
      {\Large {\bf \@mudegree}} \\[\@thesistitlemedskip]
      {\large by} \\[\@thesistitlemedskip]
      {\large \bf \@stua} {\large \bf (Roll No. \@rollnuma)} \\
      {\large \bf \@stub} {\large \bf (Roll No. \@rollnumb)} \\
      {\large \bf \@stuc} {\large \bf (Roll No. \@rollnumc)} \\
      %{\large \bf \@stud} {\large \bf (Roll No. \@rollnumd)} \\
      [\@thesistitlebigskip]
      {\large Under the guidance of }  \\
      {\large \bf \@advisorname} \\
      \ifx\@coadvisorname\@empty
         \ifx\@exadvisorname\@empty
             \mbox{}\\
	 \else
	 	     {\large and } \\
	 	     {\large \bf \@exadvisorname} \\[\@thesistitlemedskip]
	 	 \fi
	 	 \fi
	 	 \vfill
      \includegraphics[width = 50 mm, height = 44 mm]{agnel.jpg}\\
      {\large \uppercase{\@department}} \\
      {\large \bf Fr. Conceicao Rodrigues College of Engineering, Bandra (W), Mumbai - 400050}\\
      {\large University of Mumbai} \\
      {\large \@date}
    \end{center}
  \end{titlepage}
  \setcounter{footnote}{0}
  \setcounter{page}{1} %title page is NOT counted
}

%=============================================================================
% DEDICATION
%=============================================================================
% The dedication environment must do the following:
% - start a new page
% - center the text vertically
% - include the text in a center environment
%=============================================================================

\def\dedication{
  \newpage
  \thispagestyle{empty}    % No page number
  \setcounter{page}{0}
  % \addtocounter{page}{-1}
  \chapter*{}            % Required for \vfill to work
  \thispagestyle{empty}    % No page number
  \null\vfil
  \begin{center}}
\def\enddedication{\end{center}\par\vfil\newpage}

%=============================================================================
% APPROVAL SHEET
% - start a new page. page 
% - center the text vertically
%=============================================================================
\newcommand\@thesisapprovalmedskip{0.15in}
\newcommand\@thesisapprovalbigskip{0.4in}
\newcommand{\makeapproval}{
  %\setcounter{page}{2}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  
    {\LARGE \bf Approval Sheet}\\[\@thesisapprovalbigskip]
    %{\large The \@doctype\ entitled}\\[\@thesisapprovalmedskip]
    {\bf\expandafter\expandafter{\LARGE\ Project Report Approval }}\\[\@thesisapprovalmedskip]
    %\vspace{1cm}
    \end{center}
    \begin{flushleft}
   {\large This project report entitled by  \textbf{\@title} by \textbf{\@stua, \@stub, \@stuc} \, is approved for the degree of \@mudegree }\\[\@thesisapprovalmedskip]
    \end{flushleft}
    
    
    %{\Large \bf \@stud} {\Large (Roll No. \@rollnumd)}\\
    %[\@thesisapprovalmedskip]
    \ifx\@coadvisorname\@empty
    \ifx\@exadvisorname\@empty % no co-advisor/external advisor
    \vspace{2cm}
 
  \begin{flushright}\begin{tabular}{l}
  Examiners \\ 
  1.-------------------------------------- \\ 
  2.-------------------------------------- \\
  \end{tabular}\end{flushright}

\vspace{1cm}

\begin{flushleft}\begin{tabular}{l}
  Date: \\ 
  Place:\\
  \end{tabular}\end{flushleft}
  \let\thanks\relax
  \let\maketitle\relax \let\mudegree\relax \let\project\relax \let\prelim\relax
  \let\department\relax
  \gdef\@thanks{}\gdef\@mudegree{}\gdef\@doctype{}
  \gdef\@department{}
}

\newcommand{\makecertificate}{
  %\setcounter{page}{2}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
  
    {\LARGE \bf Internal Approval Sheet}\\[\@thesisapprovalbigskip]
    %{\large The \@doctype\ entitled}\\[\@thesisapprovalmedskip]
    {\bf\expandafter\expandafter{\LARGE\ CERTIFICATE }}\\[\@thesisapprovalmedskip]
    %\vspace{1cm}
    \end{center}
   \begin{flushleft}
   This is to certify that the project entitled \textbf{"\@title"} is a bonafide work of  \textbf{\@stua (\@rollnuma), \@stub (\@rollnumb), \@stuc (\@rollnumc)} \, submitted to the University of Mumbai in partial fulfillment of the requirement for the award of the degree of \textbf{Bachelor of Engineering} in \textbf{Electronics}
   \end{flushleft} 
   
    %{\Large \bf \@stud} {\Large (Roll No. \@rollnumd)}\\
    %[\@thesisapprovalmedskip]
    \ifx\@coadvisorname\@empty
    \ifx\@exadvisorname\@empty % no co-advisor/external advisor
    \vspace{2cm}
 
  \begin{center}\begin{tabular}{p{4cm} p{3cm} p{4cm} }
   & (Name and sign)\newline Supervisor/Guide  &\\ 
   && \\
   && \\
   && \\
   && \\
   && \\
   (Name and sign)\newline Head of Department & & (Name and sign)\newline Principal \\
  \end{tabular}\end{center}

\vspace{1cm}

}
%=============================================================================
% Declaration
%=============================================================================
% The acknowledgments environment must do the following:
% - start a new page with ACKNOWLEDGMENTS centered two inches from the top
%=============================================================================
\newcommand{\makedeclaration}{
  \newpage
  \begin{center}
  \noindent {\huge \bf Declaration}
  \end{center}
  We declare that this written submission represents our ideas in our own words
  and where others' ideas or words have been included, we have adequately cited
  and referenced the original sources. We also declare that we have adhered to all
  principles of academic honesty and integrity and have not misrepresented or fabricated or falsified any idea/data/fact/source in my submission. We understand that any violation of the above will be cause for disciplinary action by the Institute and can also evoke penal action from the sources which have thus not been properly cited or from whom proper permission has not been taken when needed.
  %\thispagestyle{empty}
  \doublespace
  \vfill
  \begin{flushright}
    \begin{tabular}{c}
          \@stua \quad (Roll No. \@rollnuma) {\bf (sign)}\rule{3cm}{1sp} \\  
          \@stub \quad (Roll No. \@rollnumb) {\bf (sign)}\rule{3cm}{1sp} \\ 
          \@stuc \quad (Roll No. \@rollnumc) {\bf (sign)}\rule{3cm}{1sp} \\ 
          %\@stud \quad (Roll No. \@rollnumd) {\bf (sign)}\rule{3cm}{1sp} \\         
          \\[\@thesisapprovalbigskip]\\
        \end{tabular}
  \end{flushright}
  \flushleft Date: \@date
      }

%=============================================================================
% CERTIFICATE OF COURSE WORK
%=============================================================================
% joining date is required for certificate of course work
\newcommand{\joiningdate}[1]{\gdef\@joindate{#1}}
\gdef\@joindate{``Unknown''}
%   - define counters for course numbers & credits, initialize to 0
\newcounter{@course}\setcounter{@course}{0}
\newcounter{@credits}\setcounter{@credits}{0}

%   - command to add a course. it accepts 3 arguments:
%     Course ID, Course Name, and Course Credits.
\newcommand{\addcourse}[3]{%
  \addtocounter{@course}{1}
  \the@course & #1 & #2 & #3
  \addtocounter{@credits}{#3} \\\hline}
\newcommand{\addppcourse}[3]{%
  \addtocounter{@course}{1}
  \the@course & #1 & #2 & #3
  \\\hline}

%  - finally the environment to print course list in tabular form
\newenvironment{coursecertificate}{
  \newpage
  %\setcounter{page}{0}
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    {\Large Fr. Conceicao Rodrigues College of Engineeing}\\
    \vspace{.3in}
    {\Large \bf CERTIFICATE}\\
    \vspace{.5in}
  \end{center}
  {\large This is to certify that {\bf \@author} (Roll No. \@rollnum)
    was admitted to the candidacy of Ph.D. degree on \@joindate,
    after successfully completing all the courses required for the
    Ph.D. programme. The details of the course work done are given
    below.}\\
  \vspace{.3in}\\
  \begin{tabular}{|r|l|p{10cm}|r|}
    \hline
    {\bf S.No} & {\bf Course Code} & {\bf Course Name} & {\bf Credits}\\
    \hline\hline}% Begining of environment
  {
    \hline
    & & {\bf Total Credits} & {\bf \the@credits} \\ \hline
  \end{tabular}
  
  \vfill
  {\large 
  \begin{tabular}{lp{2.2in}r}
    IIT Bombay &&\\
    Date: & &Dy. Registrar (Academic)
  \end{tabular}} % End of Course Certificate
}


%=============================================================================
% ABSTRACT
%=============================================================================
% The abstract should begin with two single-spaced lines describing
% the author and title in a standard format.  After these lines comes
% the standard abstract.
%=============================================================================
\def\abstract{
  \chapter*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
  \relax\markboth{ABSTRACT}{ABSTRACT}}
\def\endabstract{\par\newpage}

%=============================================================================
% COPYRIGHTPAGE
% The copyright must do the following:
% - start a new page with no number
% - place the copyright text centered at the bottom.
%=============================================================================
\def\copyrightpage{
  \newpage
  \thispagestyle{empty}    % No page number
  \setcounter{page}{0}
  % \addtocounter{page}{-1}
  \chapter*{}            % Required for \vfill to work
  \begin{center}
   \vfill
   \copyright\ Copyright by \@authora\ \@date\\
   All Rights Reserved
  \end{center}}


%=============================================================================
% GLOSSARY
%=============================================================================
% The glossary environment must do the following:
% - produce the table of contents entry for the glossary
% - start a new page with GLOSSARY centered two inches from the top
%=============================================================================
\def\glossary{
  \chapter*{Glossary}
  \addcontentsline{toc}{chapter}{Glossary}}
\def\endglossary{\par\newpage}

%=============================================================================
% NOMENCLATURE
%=============================================================================
% The nomenclature environment must do the following:
% - produce the table of contents entry for the nomenclature section
% - start a new page with NOMENCLATURE centered two inches from the top
%=============================================================================
\def\nomenclature{ 
  \chapter*{Nomenclature}
  \addcontentsline{toc}{chapter}{Nomenclature}}
\def\endnomenclature{\par\newpage}

%=============================================================================
% LIST OF SYMBOLS
%=============================================================================
% The list of symbols environment must do the following:
% - produce the table of contents entry for the list of symbols section
% - start a new page with LIST OF SYMBOLS centered two inches from the top
%=============================================================================
\def\listofsymbols{
  \chapter*{List of Symbols}
  \addcontentsline{toc}{chapter}{List of Symbols}}
\def\endlistofsymbols{\par\newpage}

%=============================================================================
% VITA
%=============================================================================
% The vita environment must do the following:
% - produce a separator page with the word vita centered
% - produce the table of contents entry for the vita
% - start a new page with VITA centered two inches from the top
%=============================================================================
\def\vita{
  \chapter*{Vita}
  \addcontentsline{toc}{chapter}{Vita}}
\def\endvita{\par\newpage}

%=============================================================================
% ACKNOWLEDGMENTS
%=============================================================================
% The acknowledgments environment must do the following:
% - start a new page with ACKNOWLEDGMENTS centered two inches from the top
%=============================================================================
\def\acknowledgments{
  \chapter*{Acknowledgments}
  
  \thispagestyle{empty}
  \doublespace}
\def\endacknowledgments{%
\vfill
  \begin{flushright}
             \@stua {(Roll No. \@rollnuma)} \\
             \@stub {(Roll No. \@rollnumb)} \\
             \@stuc {(Roll No. \@rollnumc)} \\
             %\@stud {(Roll No. \@rollnumd)}
    \end{flushright}
\noindent Date: \@date
 }
%=============================================================================
% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.
%      NUMBER : Figure or table number--e.g., 'Figure 3.2'
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.
%=============================================================================
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \singlespace#1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%=============================================================================
% LIST OF FIGURES; LIST OF TABLES
%  These macros from report.cls have been modified to add entry in the
%  Contents table
%=============================================================================
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }
\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }
%=============================================================================
% These commands can be used in the thesis to switch between single
% and double spacing.  This is needed, for instance, in the abstract.
%=============================================================================
\newcommand{\oneskip}{1.0}
\newcommand{\twoskip}{1.5}
\newcommand{\singlespace}
  {\renewcommand{\baselinestretch}{\oneskip}\Large\normalsize}
\newcommand{\doublespace}
  {\renewcommand{\baselinestretch}{\twoskip}\Large\normalsize}

%=============================================================================
% Finally set the various lengths/margins as required by IITB format
% Check out LaTeX Companion for more details.
%=============================================================================
% Paper height & width (A4 paper) - set by a4paper option to report
%\setlength{\paperheight}{297mm}
%\setlength{\paperwidth}{210mm}
% total text area: height & width
\setlength{\textheight}{245mm}
\setlength{\textwidth}{160mm}

\setlength{\headheight}{3mm}
\setlength{\headsep}{12mm}
\setlength{\topmargin}{15mm}
% left side empty space on odd- & even-numbered pages
\if@twoside
  \typeout{Two side is true}
  \setlength{\oddsidemargin}{30mm}  % for two side printing
  \setlength{\evensidemargin}{20mm}
\else
  \typeout{Two side is false}
  \setlength{\oddsidemargin}{30mm}  % for one side printing
  \setlength{\evensidemargin}{30mm} % odd side margin = even side margin
\fi
\setlength{\hoffset}{-1in} % already accounted for in the margins
\setlength{\voffset}{-1in} % already accounted for in the margins
% line, paragraphs indent & spacing
\setlength{\parindent}{5ex} % indentation 5 characters approx.

\doublespace

%=============================================================================
% END FILE
%=============================================================================
