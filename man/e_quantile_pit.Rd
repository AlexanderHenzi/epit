% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/e_quantile_pit.R
\name{e_quantile_pit}
\alias{e_quantile_pit}
\title{E-values for calibration of quantile PIT}
\usage{
e_quantile_pit(
  zu,
  zl,
  h,
  strategy = "grenander",
  options = list(),
  check = FALSE
)
}
\arguments{
\item{zu, zl}{quantile PIT (can be computed with \code{\link{quantile_pit}}).}

\item{h}{forecast lag (positive integer). For example, daily forecasts for
the next day have lag 1, daily forecasts for an event two days ahead have
lag 2.}

\item{strategy}{strategy for evaluating calibration. Available are
\code{"grenander"} for the Grenander estimator, and \code{"bernstein"}
for e-values based on Bernstein polynomials.}

\item{options}{options for the given strategy (see \code{\link{grenander_e}}
and \code{\link{bernstein_e}} for the available parameters).}

\item{check}{check for correct format of input parameters.}
}
\value{
If \code{h} equals 1: Returns a list containing the vector of e-values
(\code{e}), separate e-values for the upper and lower quantile PIT
(\code{eu}, \code{el}), and the forecast lag \code{h}.

If \code{h} is greater than 1: the list contains for each \code{j=1,2,...,h}
a list with the e-values for all observations with indices
\code{j,j+h,j+2h,...}.
}
\description{
Tests if quantile forecasts are probabilistically calibrated.
}
\details{
For continuously distributed observations (when \code{zu,zl} may only
attain finitely many different values), it is recommended to use
\code{strategy="grenander"}.
}
\examples{
n <- 360
sim <- simulate_pit(n, "quantile_pit", K = 19, bias = 0.2, dispersion = 0)

# If z is a lag 1 forecast:
e <- e_quantile_pit(sim$zu, sim$zl, h = 1, strategy = "grenander")
evalue_merge(e)
prod(e$e)
max(cumprod(e$e))

# Lag 2:
e <- e_quantile_pit(sim$zu, sim$zl, h = 2, strategy = "grenander")
str(e)
evalue_merge(e)
}
\seealso{
\code{\link{quantile_pit}} for computing the quantile PIT from forecasts.

\code{\link{grenander_e}}, \code{\link{bernstein_e}} for related tests of
stochastic dominance.
}
