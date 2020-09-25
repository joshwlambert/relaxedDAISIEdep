---
title: "Relaxing ..."
---

# relaxedDAISIE

<!-- badges: start -->
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Travis build status](https://travis-ci.com/joshwlambert/relaxedDAISIE.svg?branch=master)](https://travis-ci.com/joshwlambert/relaxedDAISIE)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/joshwlambert/relaxedDAISIE?branch=master&svg=true)](https://ci.appveyor.com/project/joshwlambert/relaxedDAISIE)
[![Codecov test coverage](https://codecov.io/gh/joshwlambert/relaxedDAISIE/branch/master/graph/badge.svg)](https://codecov.io/gh/joshwlambert/relaxedDAISIE?branch=master)
<!-- badges: end -->

relaxedDAISIE is a package that contains all the code to reproduce Lambert
et al. (2020) doi:

This package is tailored to the Peregrine High Performance Computer Cluster at
the University of Groningen.

## Installation

You can install the released version of relaxedDAISIE from [github](https://github.com/joshwlambert/relaxedDAISIE) with:

``` r
devtools::install.github("joshwlambert/relaxedDAISIE")
```

The package can also be installed using the bash script:
```{bash}
install_relaxedDAISIE.sh
```

## Empirical Analysis

Individuals archipelagos can be analysed by calling the respective
*_model.sh file, for example:
```{bash}
Aldabra_Group_models.sh
```

All archipelago model can be run in parallel by running:
```{bash}
run_all_archipelago_models.sh
```

Once the models have been run the best maximum likelihood model can be extracted
from the replicates using:
``` r
find_max_loglik()
``` 
