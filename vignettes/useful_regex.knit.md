---
title: "useful_regex"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{useful_regex}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---



```r
cat("# Spacje nierozdzielające w LaTeX
(\\b)([WUIOAZwioaz])(\\b )
\\2\\\\nobreakspace{}

# Poprawka spacji nierozdzielających o polskie znaki (!!! dodać spację po \\1 !!!)
([ęóąłżźćń]\\w)\\\\nobreakspace\\{\\}
\\1 

# Zmiana znaku dziesiętnego na przecinki
(?<=\\d)\\.(?=\\d)
,

# Zera wiodące (z kropki)
(?<!\\d)\\.(?=\\d)
0,
")
```

# Spacje nierozdzielające w LaTeX
(\b)([WUIOAZwioaz])(\b )
\2\\nobreakspace{}

# Poprawka spacji nierozdzielających o polskie znaki (!!! dodać spację po \1 !!!)
([ęóąłżźćń]\w)\\nobreakspace\{\}
\1 

# Zmiana znaku dziesiętnego na przecinki
(?<=\d)\.(?=\d)
,

# Zera wiodące (z kropki)
(?<!\d)\.(?=\d)
0,
