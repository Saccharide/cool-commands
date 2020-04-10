* Bolding text
```
\textbf{BOLD}
```

* Italicizing text
```
\textit{BOLD}
```

* Caching files for pgfplot by creating generated files inside a subdirectory
```
\usepackage{tikz}
\usepackage{pgfplots,pgfplotstable}\pgfplotsset{compat=1.9}
\usetikzlibrary{external}
\tikzexternalize[prefix=tikz/]

```
* Inserting a figure or picture
```
\usepackage{graphicx}
\begin{figure}[h]
    \centering
    \includegraphics[width=2.8in]{figs/path} 
    \caption{}
\label{fig:figlabel}
\end{figure}
```
* Inserting a figure that spans two columns
```
\usepackage{graphicx}
\begin{figure*}[t]
    \centering
    \includegraphics[width=\textwidth]{figs/path} 
    \caption{}
\label{fig:figlabel}
\end{figure*}
```

* Referencing a figure inside latex
```
\figref{fig:FIGLABEL}
```

* Referencing another section
```
\ref{sec:SECLABEL}
```

* Normal in-text citation
```
\cite{smartthings}
```
