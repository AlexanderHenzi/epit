
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epit package

<!-- badges: start -->
<!-- badges: end -->

The **epit** package contains functions for testing whether the
probability integral transform (PIT), the quantile PIT, or rank
histograms significantly deviate from a uniform distribution. Also
allows sequential tests for stochastic dominance compared to the uniform
distribution.

## Installation

Install the the development version from [GitHub](https://github.com/)
with:

``` r
# install.packages("devtools")
devtools::install_github("AlexanderHenzi/epit")
```

## Main functions

-   `e_pit` for testing uniformity of pit, with methods `beta_e` and
    `kernel_e.`

-   `e_quantile_pit` for testing calibration of quantile forecasts, with
    methods `grenander_e` and `bernstein_e` (these methods can also be
    applied for stochastic dominance testing).

-   `e_rank_histogram` for testing uniformity of rank histograms, with
    methods `betabinom_e` and `empirical_e.`

Further useful functions:

-   `quantile_pit` for computing the quantile PIT from quantile
    forecasts and observations, `ensemble_rank` for computing the rank
    histograms from ensemble forecasts and observations.

-   `evalue_merge` for merging the output of the above functions into a
    single e-value for hypothesis testing.

-   `evalue_combine_h` for combining e-values at different forecast
    lags.

## References

S. Arnold, A. Henzi, and J. F. Ziegel. Sequentially valid tests for
forecast calibration. Preprint, 2021. Available at
<https://arxiv.org/abs/2109.11761>.

The folder `replication_material` contains replication material for the
simulations and the case study in the article.
