
<!-- README.md is generated from README.Rmd. Please edit that file -->

# polcanR

<!-- badges: start -->
<!-- badges: end -->

## Overview

polcanR is an R package that connects to a database containing all the
tweets related to the 2021 Canadian elections between August 15, 2021
(election call) and September 20, 2021 (end of the election). [Thierry
Warin](https://warin.ca) and his team powered by the
[nüance-R](https://nuance-r.com) platform have collected all the tweets
on this period containing one or more of the following hashtags:

-   \#elxn44
-   \#cdnpoli
-   \#polcan
-   \#ItsOurVote
-   \#CestNotreVote

We used this data to create a dashboard that tracked the dynamics of
conversations on twitter. The dashboard is available
[here](https://warin.ca/elections_en/).

## Installation

You can install the released version of polcanR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("polcanR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("warint/polcanR")
```

Practical usage

## Quick start

First, install polcanR:

``` r
install.packages("polcanR")
```

Next, call polcanR to make sure everything is installed correctly.

``` r
library(polcanR)
```

## How-To

### Getting the data

A user needs to enter the ISO code of a country. To have access to this
code, the following function provides this information.

``` r
polcanR::polcanr_data() # All the tweets, in all languages between August 15, 2021 (election call) and September 20, 2021 (end of the election).
polcanR::polcanr_data(dates = "2021-09-01") # All the tweets, in all languages on September 1,  2021.
polcanR::polcanr_data(languages = "en") # All the tweets in English between August 15, 2021 (election call) and September 20, 2021 (end of the election).
polcanR::polcanr_data(dates = c("2021-08-15", "2021-09-20"),languages = c("en","fr")) # All the tweets in English and French on August 15, 2021 and September 20, 2021.
```
