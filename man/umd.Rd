% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bernstein_densities.R
\name{umd}
\alias{umd}
\title{Monotone density estimation with Bernstein polynomials}
\usage{
umd(data, monotone = "Iso", crit = "CN", m = NULL, settings = list())
}
\arguments{
\item{data}{observations (in [0,1]).}

\item{monotone}{chose \code{"Iso"} for monotone increasing or \code{"Decr"}
for monotone decreasing.}

\item{crit}{the type of criterion to use for selecting the number of weights.
Defaults to \code{"CN"}, other choices are \code{"AIC"} and \code{"BIC"}.}

\item{m}{maximum degree of the Bernstein polynomials in the mixture. If
\code{NULL}, an optimal \code{m} is estimated with the AIC, BIC or CN
criterion specified.}

\item{settings}{options for \code{\link[osqp]{osqp}}.}
}
\value{
A list containing the estimated weights, \code{m}, the density, distribution,
random number generation and quantile function for the estimate density,
and the bounds of the support.
}
\description{
Estimates a smooth monotone mixture of beta densities.
}
\author{
Original code by Bradley C. Turnbull, NC State University, Dr. Sujit K.
Ghosh, NC State University, August 25, 2013, suitably adapted by Sebastian
Arnold and Alexander Henzi.
}
