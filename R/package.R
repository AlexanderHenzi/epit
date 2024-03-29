#' E-Values for testing probabilistic calibration
#'
#' This package contains functions for testing whether the probability
#' integral transform (PIT), the quantile PIT, or rank histograms significantly
#' deviate from a uniform distribution. Also allows sequential tests for
#' stochastic dominance compared to the uniform distribution.
#'
#' @section How does it work?:
#' For details, see the preprint in the references below.
#'
#' @section Main functions in the \pkg{epit} package:
#'
#' \itemize{
#' \item \code{\link{e_pit}} for testing uniformity of pit, with methods
#'     \code{\link{beta_e}} and \code{\link{kernel_e}}.
#' \item \code{\link{e_quantile_pit}} for testing calibration of quantile
#'     forecasts, with methods \code{\link{grenander_e}} and
#'     \code{\link{bernstein_e}} (these methods can also be applied for
#'     stochastic dominance testing).
#' \item \code{\link{e_rank_histogram}} for testing uniformity of rank
#'     histograms, with methods \code{\link{betabinom_e}} and
#'     \code{\link{empirical_e}}.
#' }
#'
#' Further useful functions:
#' \itemize{
#' \item \code{\link{quantile_pit}} for computing the quantile PIT from quantile
#'     forecasts and observations, \code{\link{ensemble_rank}} for computing
#'     the rank histograms from ensemble forecasts and observations.
#' \item \code{\link{evalue_merge}} for merging the output of the above
#'     functions into a single e-value for hypothesis testing.
#' \item \code{\link{evalue_combine_h}} for combining e-values at different
#'     forecast lags.
#' }
#'
#' @docType package
#' @name epit-package
#'
#' @useDynLib epit, .registration = TRUE
#'
#' @references
#'
#' S. Arnold, A. Henzi, and J. F. Ziegel. Sequentially valid tests for forecast
#' calibration. Preprint, 2021. Available at
#' \url{https://arxiv.org/abs/2109.11761}.
#'
NULL

#' Unload dll when package is unloaded
#'
#' @return
#' No return value, called for side effects.
#'
#' @keywords internal
.onUnload <- function (libpath) {
  library.dynam.unload("epit", libpath)
}
