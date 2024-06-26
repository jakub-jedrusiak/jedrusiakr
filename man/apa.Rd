% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/apa.R
\name{apa}
\alias{apa}
\title{APA printers}
\usage{
apa(test_result, pl = TRUE)
}
\arguments{
\item{test_result}{a result of a statistical test as returned by a function from the \code{rstatix} package. Currently supported are \code{t_test()}, \code{chisq_test()}.}

\item{pl}{if \code{TRUE} then polish format is used}

\item{model}{a model object}

\item{row_number}{row number of the ANOVA model to report}

\item{adj_r_sq}{if \code{TRUE} then adjusted R-squared is reported}
}
\value{
a string with the APA formatted test result
}
\description{
APA printers
}
