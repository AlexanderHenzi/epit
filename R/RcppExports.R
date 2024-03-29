# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#' Maximum likelihood estimation for beta distribution
#'
#' Estimates a beta-distribution by maximum likelihood, with pre-formatted
#' inputs for efficiency.
#'
#' @param tol tolerance for stopping (small positive number).
#' @param max_it maximum number of iterations in Newton method.
#' @param sly1 sum of log-observations.
#' @param sly2 sum of logs of 1 minus the observations.
#' @param sy sum of observations.
#' @param sy2 of squared observations.
#' @param n sample size.
#'
#' @details
#' Estimation is performed with a Newton method and the moment matching
#' estimators as starting values. Estimated parameters below 0.001 or above 100
#' are truncated for stability.
#'
#' This function is intended for internal use only.
#'
#' @return
#' NumericVector containing the parameters of the beta distribution.
#'
#' @author
#' Code is ported to Rcpp from the Rfast package (beta.mle) by Alexander Henzi.
#'
#' @keywords internal
#' @name beta_mle_sequential
NULL

#' Compute e-values based on beta distrbution
#'
#' Sequentially estimate a beta distribution and evaluate the density at the
#' next point in the sample.
#'
#' @param z numbers in (0,1), should not be equal to 0 or 1.
#' @param tol tolerance for stopping (small positive number).
#' @param max_it maximum number of iterations in Newton method.
#' @param n0 starting sample size. The first \code{n0} observations are used
#'     only for estimation and the e-values are not computed.
#'
#' @details
#' This function is intended for internal use only.
#'
#' @return
#' List containing the e-values (density evaluated at the given value of
#' \code{z[i]}) and a matrix of the parameters for each index \code{i}.
#'
#' @name beta_e_cpp
#' @keywords internal
beta_e_cpp <- function(z, tol, max_it, n0) {
    .Call(`_epit_beta_e_cpp`, z, tol, max_it, n0)
}

#' Probability function of betabinomial distribution
#'
#' Computes the probability function of the betabinomial distribution.
#'
#' @param x quantile (single number, not vectorized).
#' @param a first parameter of beta distribution (single number).
#' @param b first parameter of beta distribution (single number).
#' @param N number of trials (single number).
#'
#' @return
#' Probability of \code{x} under the distribution specified by the parameters.
#'
#' @name dbetabinom
#' @keywords internal
NULL

#' Wrapper for sums of digamma function
#'
#' Apply digamma function to vector and compute scalar product with another
#' vector
#'
#' @param u numeric vector (NumericVector).
#' @param v numeric vector (NumericVector, same length as \code{u})
#'
#' @return
#' Single number (double), the result.
#'
#' @name sdigammav
#' @keywords internal
NULL

#' Wrapper for sums of trigamma function
#'
#' Apply trigamma function to vector and compute scalar product with another
#' vector
#'
#' @param u numeric vector (NumericVector).
#' @param v numeric vector (NumericVector, same length as \code{u})
#'
#' @return
#' Single number (double), the result.
#'
#' @name strigammav
#' @keywords internal
NULL

#' Maximum likelihood estimation for betabinomial distribution
#'
#' Estimates a betabinomial distribution by maximum likelihood, with
#' pre-formatted inputs for efficiency.
#'
#' @param N number of trials (int).
#' @param n total sample size (int).
#' @param z vector from 0 to N (NumericVector).
#' @param n1 vector of counts how often \code{z[i]} has been observed
#'     (NumericVector).
#' @param n2 vector of counts how often \code{N-z[i]} has been observed
#'     (NumericVector).
#' @param m1 sums of observations (double).
#' @param sums of squared observations (double).
#' @param tol tolerance for stopping (small positive number).
#' @param max_it maximum number of iterations in Newton method.
#'
#' @details
#' Estimation is performed with a Newton method and the moment matching
#' estimators as starting values. Estimated parameters below 0.001 or above 100
#' are truncated for stability.
#'
#' This function is intended for internal use only.
#'
#' @return
#' NumericVector containing the parameters of the betabinomial distribution.
#'
#' @author
#' Code is ported to Rcpp from the Rfast package (beta.mle) by Alexander Henzi.
#'
#' @name betabinom_mle_sequential
#' @keywords internal
NULL

#' Compute e-values based on betabinomial distrbution
#'
#' Sequentially estimate a betabinomial distribution and compute e-values.
#'
#' @param r numbers in \code{1,...,m}.
#' @param N number of trials (equal to \code{m} above).
#' @param tol tolerance for stopping (small positive number).
#' @param max_it maximum number of iterations in Newton method.
#' @param n0 starting sample size. The first \code{n0} observations are used
#'     only for estimation and the e-values are not computed.
#'
#' @details
#' This function is intended for internal use only.
#'
#' @return
#' List containing the e-values (density evaluated at the given value of
#' \code{r[i]}) and a matrix of the parameters for each index \code{i}.
#'
#' @name betabinom_e_cpp
#' @keywords internal
betabinom_e_cpp <- function(r, N, tol, max_it, n0) {
    .Call(`_epit_betabinom_e_cpp`, r, N, tol, max_it, n0)
}

#' Sequential computation and evaluation of the Grenander estimator
#'
#' For observations \code{Z} and all indices \code{i=2,...,length(Z)}, the
#' Grenander estimator is computed with data \code{Z[1],...Z[i-1]} and
#' evaluated at \code{Z[i]}.
#'
#' @param z sorted distinct values of the data \code{Z}.
#' @param pos_Z integer vector giving for each index \code{i} the position of
#'    of the i-th data point \code{Z[i]} in \code{z}. Indexing starts at 1.
#'
#' @return
#' Vector of the density evaluated (same length as \code{pos_Z}, the first
#' entry is set to 1).
#'
#' @name sequential_grenander
#' @keywords internal
#'
sequential_grenander <- function(z, pos_Z) {
    .Call(`_epit_sequential_grenander`, z, pos_Z)
}

#' Sequential computation of e-values for discrete uniform distribution
#' (empirical)
#'
#' For a sample \code{r} in \code{1,...,m}, compute e-values for testing the
#' null hypothesis that \code{r} follows the uniform distribution on
#' \code{1,...,m}.
#'
#' @param r observations.
#' @param m size of discrete uniform distribution PLUS ONE (positive integer,
#'     greater or equal to \code{max(r)+1}).
#' @param n0 minimum number of observations for starting. All e-values until
#'     \code{n0} (included) are equal to 1.
#' @param ... currently not used, only for calling the function with
#'     \code{do.call}.
#'
#' @return
#' List containing the of e-values.
#'
#' @name sequential_ranks
#' @keywords internal
sequential_ranks <- function(r, m, n0) {
    .Call(`_epit_sequential_ranks`, r, m, n0)
}

