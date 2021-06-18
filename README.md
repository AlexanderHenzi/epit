
<!-- README.md is generated from README.Rmd. Please edit that file -->

# epit package

<!-- badges: start -->
<!-- badges: end -->

The **epit** package provides significance tests for checking
probabilistic calibration of forecasts, including uniformity tests for
the probability integral transform (PIT), for the quantile PIT, and for
rank histograms.

## Installation

Install from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("AlexanderHenzi/epit")
```

## Example

Let `y` be standard normal, and consider the probabilistic forecasts

-   `F1 = N(0,1)` (perfect forecast),
-   `F2 = N(0.2,1)` (biased forecast),
-   `F3 = N(0, 0.8)` (underdispersed forecast).

To check *probabilistic calibration* of a forecast, one plots a
histogram of `G_i(y_i)`, `i=1,...,n`, where `G_i` and `y_i` are the
forecast and observation at time `i`. The quantity `G(y)` is the
*probability integral transform (PIT)*.

``` r
set.seed(1)
n <- 730
y <- rnorm(n)
pit1 <- pnorm(y)
pit2 <- pnorm(y, mean = 0.2)
pit3 <- pnorm(y, sd = sqrt(0.8))

par(mfrow = c(1, 3))
brk <- seq(0, 1, 0.1)
hist(pit1, breaks = brk, main = "PIT for F1", freq = F, ylim = c(0, 1.5))
abline(h = 1, lty = 3)
hist(pit2, breaks = brk, main = "PIT for F2", freq = F, ylim = c(0, 1.5))
abline(h = 1, lty = 3)
hist(pit3, breaks = brk, main = "PIT for F3", freq = F, ylim = c(0, 1.5))
abline(h = 1, lty = 3)
```

<img src="man/figures/README-example-1.png" width="100%" />

For a *probabilistically calibrated* forecast, the PIT should be
*uniformly distributed*. The **epit** package allows to perform
significance tests for uniformity, which are valid even if the forecasts
and observations have an *arbitrary dependence over time
(autocorrelation, non-stationarity, …)*.

``` r
library(epit)

# function "e_pit" tests for uniformity of the PIT
# parameters:
# - z: the PIT
# - h: the forecast lag (time between forecast and observation)

test1 <- e_pit(pit1, h = 1)
test2 <- e_pit(pit2, h = 1)
test3 <- e_pit(pit3, h = 1)

evalue_merge(test1)$e_end
#> [1] 0.00334278
evalue_merge(test2)$e_end
#> [1] 65291.64
evalue_merge(test3)$e_end
#> [1] 3744.59
```

The tests are based on *e-values*. The larger the e-value `e`, the more
evidence against the null hypothesis (more evidence against
probabilistic calibration), and `1/e` is a valid p-value.
Interpretation: If we bet 1 dollar against the hypothesis that `F2` is
probabilistically calibrated, then after n = 730 days, we would have
turned this 1 dollar into 65’291 dollars. For `F1`, we would remain with
only 0.0033 dollars…

``` r
# transform into p-values
min(1, 1 / evalue_merge(test1)$e_end)
#> [1] 1
min(1, 1 / evalue_merge(test2)$e_end)
#> [1] 1.53159e-05
min(1, 1 / evalue_merge(test3)$e_end)
#> [1] 0.0002670519
```

# References

Preprint:
