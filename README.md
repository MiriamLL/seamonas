
<!-- README.md is generated from README.Rmd. Please edit that file -->

# seamonas <img src="man/figures/seamonashexsticker.png" align="right" height="200" />

<!-- badges: start -->
<!-- badges: end -->

**seamonas** provides easy access to information based on guidelines for
monitoring seabirds at sea. It includes detailed table content and a
sample dataset to support implementation. Information based on the
HELCOM Monitoring Guidelines for Seabirds at Sea [ESAS
database](https://helcom.fi/wp-content/uploads/2021/11/HELCOM-Monitoring-guidelines-for-seabirds-at-sea-monitoring.pdf)

## About

**seamonas** contains:

- **549** species across **9** morphological separated groups.
- **one** transect example from a monitoring.
- **unified** descriptions abiotic elements and events that could impact
  birds, such as ships, fishing vessels, sailboats (with their
  activities), wind farms, ocean fronts and boundaries, oil slicks, and
  similar factors that should be noted during the transects.

## Installation

You can install the development version of seamonas from
[GitHub](https://github.com/) with:

``` r
devtools::install_github("MiriamLL/seamonas")
```

## Start

Load the package

``` r
library(seamonas)
```

### Data

`**seamonas**` contains:  
- **549** species names across **9** morphological separated groups.

To add the data to the R Environment.

``` r
data(Code_Euring)
```

Contains the information from Code, Scientific_name, English_name and
Artificial_tax_class.

``` r
head(Code_Euring)
#>   Code     Scientific_name         English_name Artificial_tax_class
#> 1   20      Gavia stellata   Red-throated Diver               Divers
#> 2   30       Gavia arctica Black-throated Diver               Divers
#> 3   40         Gavia immer Great Northern Diver               Divers
#> 4   50       Gavia adamsii   White-billed Diver               Divers
#> 5   59         Gavia spec.   unidentified diver               Divers
#> 6   60 Podilymbus podiceps    Pied-billed Grebe               Grebes
```

**Key fields**:

`Code`: Numerical code based on
[Euring](https://euring.org/data-and-codes/euring-codes). The species
codes are primarily based on the EURING list, with additional
‘uncertainty codes’ commonly used by ESAS partners to represent species
groups that are often difficult to identify under at-sea field
conditions.  
`Scientific_name`: A scientific name is the standardized, universally
accepted name used to identify and classify living organisms. It follows
a system called binomial nomenclature.  
`English_nam`e`: Official common name of the species.`Artificial_tax_class\`:
A custom classification system based on taxonomic and morphological
similarities among species.

## Citation

If you use **seamonas** for your research, please consider citing this
package.

Lerma M (2025). Package seamonas. Access guidelines information for
monitoring seabirds at sea. <https://github.com/MiriamLL/seamonas>

Additional references:

Kotzerka, J., Markones, N., Dierschke, V., & Auniņš, A. (2021).
Guidelines for monitoring seabirds at sea. In Helsinki Commission.
<https://helcom.fi/wp-content/uploads/2021/11/HELCOM-Monitoring-guidelines-for-seabirds-at-sea-monitoring.pdf>
