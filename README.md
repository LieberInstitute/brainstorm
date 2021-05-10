
<!-- README.md is generated from README.Rmd. Please edit that file -->

# brainstorm

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/joshstolz/brainstorm/branch/master/graph/badge.svg)](https://codecov.io/gh/joshstolz/brainstorm?branch=master)
[![Codecov test
coverage](https://codecov.io/gh/LieberInstitute/brainstorm_package/branch/master/graph/badge.svg)](https://codecov.io/gh/LieberInstitute/brainstorm_package?branch=master)
[![R-CMD-check-bioc](https://github.com/LieberInstitute/brainstorm_package/workflows/R-CMD-check-bioc/badge.svg)](https://github.com/LieberInstitute/brainstorm_package/actions)
<!-- badges: end -->

The goal of `brainstorm` is to …

## Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `brainstorm` using from
[Bioconductor](http://bioconductor.org/) the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

BiocManager::install("brainstorm")
```

And the development version from [GitHub](https://github.com/) with:

``` r
BiocManager::install("joshstolz/brainstorm")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("brainstorm")
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub!

## Citation

Below is the citation output from using `citation('brainstorm')` in R.
Please run this yourself to check for any updates on how to cite
**brainstorm**.

``` r
print(citation('brainstorm'), bibtex = TRUE)
#> 
#> To cite package 'brainstorm' in publications use:
#> 
#>   First Last (2021). brainstorm: What the Package Does (One Line, Title
#>   Case). R package version 0.99.0.
#>   https://github.com/joshstolz/brainstorm
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {brainstorm: What the Package Does (One Line, Title Case)},
#>     author = {First Last},
#>     year = {2021},
#>     note = {R package version 0.99.0},
#>     url = {https://github.com/joshstolz/brainstorm},
#>   }
```

Please note that the `brainstorm` was only made possible thanks to many
other R and bioinformatics software authors, which are cited either in
the vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `brainstorm` project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.

## Development tools

-   Continuous code testing is possible thanks to [GitHub
    actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/)
    through *[usethis](https://CRAN.R-project.org/package=usethis)*,
    *[remotes](https://CRAN.R-project.org/package=remotes)*, and
    *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)*
    customized to use [Bioconductor’s docker
    containers](https://www.bioconductor.org/help/docker/) and
    *[BiocCheck](https://bioconductor.org/packages/3.12/BiocCheck)*.
-   Code coverage assessment is possible thanks to
    [codecov](https://codecov.io/gh) and
    *[covr](https://CRAN.R-project.org/package=covr)*.
-   The [documentation website](http://.github.io/brainstorm) is
    automatically updated thanks to
    *[pkgdown](https://CRAN.R-project.org/package=pkgdown)*.
-   The code is styled automatically thanks to
    *[styler](https://CRAN.R-project.org/package=styler)*.
-   The documentation is formatted thanks to
    *[devtools](https://CRAN.R-project.org/package=devtools)* and
    *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.

This package was developed using
*[biocthis](https://bioconductor.org/packages/3.12/biocthis)*.
