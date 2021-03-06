% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/papaja_pl.R
\name{print_p_pl}
\alias{print_p_pl}
\alias{apa_num_pl}
\title{Papaja po polsku}
\usage{
print_p_pl(x, digits = 3L, na_string = "", add_equals = TRUE)

apa_num_pl(
  x,
  digits = 2L,
  gt1 = TRUE,
  zero = FALSE,
  na_string = "",
  decimal.mark = ",",
  big.mark = " ",
  add_equals = TRUE,
  ...
)
}
\arguments{
\item{x}{Can be either a single value, vector, \code{matrix}, \code{data.frame}.}

\item{digits}{Integer. The desired number of digits after the decimal point, passed on to \code{\link{formatC}}.}

\item{na_string}{Character. String to print if any element of \code{x} is \code{NA}.}

\item{add_equals}{Logical. Indicates if the output string should be
prepended with an \code{=}.}

\item{gt1}{Logical. Indicates if the statistic can, in principle, have an
absolute value greater than 1. If \code{FALSE}, leading zeros are
omitted.}

\item{zero}{Logical. Indicates if the statistic can, in principle, be 0. If
\code{FALSE}, a string of the form \verb{< 0.001} is returned instead of 0.}

\item{decimal.mark}{the character to be used to indicate the numeric decimal point.}

\item{big.mark}{character; if not empty used as mark between every big.interval decimals before (hence big) the decimal point.}

\item{...}{
  Arguments passed on to \code{\link[base:formatc]{base::formatC}}, \code{\link[papaja:apa_num]{papaja::apa_num}}
  \describe{
    \item{\code{width}}{the total field width; if both \code{digits} and
    \code{width} are unspecified, \code{width} defaults to 1,
    otherwise to \code{digits + 1}.  \code{width = 0} will use
    \code{width = digits}, \code{width < 0} means left
    justify the number in this field (equivalent to \code{flag = "-"}).
    If necessary, the result will have more characters than
    \code{width}.  For character data this is interpreted in characters
    (not bytes nor display width).
  }
    \item{\code{format}}{equal to \code{"d"}  (for integers), \code{"f"},
    \code{"e"}, \code{"E"}, \code{"g"}, \code{"G"}, \code{"fg"} (for
    reals), or \code{"s"} (for strings).  Default is \code{"d"} for
    integers, \code{"g"} for reals.

    \code{"f"} gives numbers in the usual
    \code{xxx.xxx} format;  \code{"e"} and \code{"E"} give \code{n.ddde+nn} or
    \code{n.dddE+nn} (scientific format); \code{"g"} and \code{"G"} put
    \code{x[i]} into scientific format only if it saves space to do so
    \emph{and} drop trailing zeros and decimal point - unless \code{flag}
    contains \code{"#"} which keeps trailing zeros for the \code{"g", "G"}
    formats.

    \code{"fg"} (our own hybrid format) uses fixed format as \code{"f"},
    but \code{digits} as the minimum number of \emph{significant} digits.
    This can lead to quite long result strings, see examples below.  Note
    that unlike \code{\link[base]{signif}} this prints large numbers with
    more significant digits than \code{digits}.  Trailing zeros are
    \emph{dropped} in this format, unless \code{flag} contains
    \code{"#"}.}
    \item{\code{flag}}{for \code{formatC}, a character string giving a
    format modifier as in Kernighan and Ritchie (1988, page 243) or the
    C+99 standard.\describe{
      \item{\code{"0"}}{pads leading zeros;}
      \item{\code{"-"}}{does left adjustment,}
      \item{\code{"+"}}{ensures a sign in all cases, i.e., \code{"+"} for
	positive numbers ,}
      \item{\code{" "}}{if the first character is not a sign, the space
	character \code{" "} will be used instead.}
      \item{\code{"#"}}{specifies \dQuote{an alternative output form},
	specifically depending on \code{format}.}
      \item{\code{"'"}}{on some platform--locale combination, activates
	\dQuote{thousands' grouping} for decimal conversion,}
      \item{\code{"I"}}{in some versions of \file{glibc} allow for integer
	conversion to use the locale's alternative output digits, if any.}
    }
    There can be more than one of these flags, in any order.  Other characters
    used to have no effect for \code{character} formatting, but signal
    an error since \R 3.4.0.
  }
    \item{\code{mode}}{\code{"double"} (or \code{"real"}), \code{"integer"} or
    \code{"character"}.
    Default: Determined from the storage mode of \code{x}.}
    \item{\code{big.interval}}{see \code{big.mark} above; defaults to 3.}
    \item{\code{small.mark}}{character; if not empty used as mark between every
    \code{small.interval} decimals \emph{after} (hence \code{small}) the
    decimal point.}
    \item{\code{small.interval}}{see \code{small.mark} above; defaults to 5.}
    \item{\code{preserve.width}}{string specifying if the string widths should
    be preserved where possible in those cases where marks
    (\code{big.mark} or \code{small.mark}) are added.  \code{"common"},
    the default, corresponds to \code{\link[base]{format}}-like behavior
    whereas \code{"individual"} is the default in
    \code{formatC()}. Value can be abbreviated.}
    \item{\code{zero.print}}{logical, character string or \code{NULL} specifying
    if and how \emph{zeros} should be formatted specially.  Useful for
    pretty printing \sQuote{sparse} objects.}
    \item{\code{drop0trailing}}{logical, indicating if trailing zeros,
    i.e., \code{"0"} \emph{after} the decimal mark, should be removed;
    also drops \code{"e+00"} in exponential formats.  This is simply passed
    to \code{prettyNum()}, see the \sQuote{Details}.}
  }}
}
\description{
Funkcje dostosowujące Papaję do polskich standardów APA.
}
\section{Functions}{
\itemize{
\item \code{print_p_pl}: Wartość prawdopodobieństwa

\item \code{apa_num_pl}: Liczba
}}

