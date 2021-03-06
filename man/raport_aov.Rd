% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/raport_aov.R
\name{raport_aov}
\alias{raport_aov}
\title{Raport automatyczny z jednoczynnikowej analizy wariancji}
\usage{
raport_aov(aov, roznic)
}
\arguments{
\item{aov}{Analiza wariancji}

\item{roznic}{Uzupełnienie zdania "Celem sprawdzenia różnic "}
}
\value{
Celem sprawdzenia różnic w zakresie lęku u osób o różnym stopniu obciążenia
pracą przeprowadzono jednoczynnikową analizę wariancji. Wykazała ona, że istnieją istotne
różnice (F(2,597) = 5,22; p = 0,006).
}
\description{
Funkcja tworząca automatyczne fragmenty raportu jednoczynnikowej (!) z analizy wariancji.
}
\examples{
iris_aov <- aov(Sepal.Length ~ Species, iris)
raport_aov(iris_aov, "w zakresie długości płatków u różnych gatunków irysów")
}
