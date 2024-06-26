% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ohe_col_plot.R
\name{ohe_col_plot}
\alias{ohe_col_plot}
\title{One Hot Encoding Column Plot}
\usage{
ohe_col_plot(
  df,
  col,
  cols_to_delete = NULL,
  ...,
  xlab = NULL,
  ylab = NULL,
  fill = "#6BAED5",
  colour = "#2171B5",
  angle = 90,
  hjust = 1,
  vjust = 0.5
)
}
\arguments{
\item{df}{dataframe}

\item{col}{column with multiple choice values}

\item{cols_to_delete}{names of columns to be deleted, that is additional columns after usually a comma that isn't different to the main column}

\item{...}{"new" = "old" column rename pairs}

\item{xlab}{x-axis label}

\item{ylab}{y-axis label}

\item{fill}{column fill colour}

\item{angle}{x-axis text angle}

\item{hjust}{x-axis text horizontal justification (between 0 and 1)}

\item{vjust}{x-axis text vertical justification (between 0 and 1)}

\item{color}{column outline colour}
}
\description{
One Hot Encoding Column Plot
}
