% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/checks.R
\name{check_strategy}
\alias{check_strategy}
\title{Check strategy}
\usage{
check_strategy(strategy, type)
}
\arguments{
\item{strategy}{chosen strategy for computing e-values.}

\item{type}{\code{"pit"}, \code{"quantile_pit"}, or \code{"rank_histogram"}.}
}
\value{
Error message if \code{"strategy"} is not among the available strategies
}
\description{
Check strategy
}
\keyword{internal}
