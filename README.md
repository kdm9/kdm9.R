
# kdm9.R

<!-- badges: start -->
  [![R-CMD-check](https://github.com/kdm9/kdm9.R/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kdm9/kdm9.R/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->


## Installation

You can install the development version of kdm9.R from [GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("kdm9/kdm9.R")
```

## Example


``` r
library(kdm9.R)


###### kview()
# View a dataframe in libreoffice: kview()

mydf = tibble(a=1:10, b=10-1:10)
kview(mydf)

# can also be used in pipelines, like glimpse():
mydf = tibble(a=1:10, b=10-1:10) %>%
    kview()


###### ebio_sra_extract()

```

