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
