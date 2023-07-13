
<!-- README.md is generated from README.Rmd. Please edit that file -->

# seamonas

<!-- badges: start -->
<!-- badges: end -->

The goal of seamonas is to provide tools to make plots of the North Sea

# Intro

Contains data:  
- Data from a random generated survey in CRS 3035 and CRS 4326  
- Data from random generated densities - A grid generated using the
function create_grid in CRS 3035

Contains functions for spatial analyses:  
- transform_survey  
- subset_grid  
- grid_densities

Contains function to plot:  
- plot_density  
- add_breaks  
- add_legend  
- add_theme

# Installation

You can install the development version of seamonas from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MiriamLL/seamonas")
```

``` r
library('seamonas')
```

# Data

``` r
head(survey_4326)
#>    seq survey_id longitude latitude          timestamps year month day
#> 1 1601         1  6.000000 55.10000 2018-04-01 09:00:00 2018    04  01
#> 2 1602         1  6.005013 55.09724 2018-04-01 09:01:00 2018    04  01
#> 3 1603         1  6.010025 55.09449 2018-04-01 09:02:00 2018    04  01
#> 4 1604         1  6.015038 55.09173 2018-04-01 09:03:00 2018    04  01
#> 5 1605         1  6.020050 55.08897 2018-04-01 09:04:00 2018    04  01
#> 6 1606         1  6.025063 55.08622 2018-04-01 09:05:00 2018    04  01
#>         date
#> 1 2018-04-01
#> 2 2018-04-01
#> 3 2018-04-01
#> 4 2018-04-01
#> 5 2018-04-01
#> 6 2018-04-01
```

## survey data

Data from a survey including longitude, latitude, timestamp

``` r
survey_4326<-survey_4326
```

``` r
ggplot2::ggplot()+
    ggplot2::geom_point(data=survey_4326,
                        ggplot2::aes(x=longitude, y= latitude, color=date),size = 1, shape = 16) 
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

## density data

A data frame with survey data including observations

``` r
density_survey
```

``` r
head(density_df)
#>   seq survey_id longitude latitude          timestamps year month day
#> 1   1         1  6.000000 55.10000 2018-04-01 09:00:00 2018    04  01
#> 2   2         1  6.222222 54.97778 2018-04-01 09:01:00 2018    04  01
#> 3   3         1  6.444444 54.85556 2018-04-01 09:02:00 2018    04  01
#> 4   4         1  6.666667 54.73333 2018-04-01 09:03:00 2018    04  01
#> 5   5         1  6.888889 54.61111 2018-04-01 09:04:00 2018    04  01
#> 6   6         1  7.111111 54.48889 2018-04-01 09:05:00 2018    04  01
#>         date
#> 1 2018-04-01
#> 2 2018-04-01
#> 3 2018-04-01
#> 4 2018-04-01
#> 5 2018-04-01
#> 6 2018-04-01
```

## grid 5x5

A grid 5x5 in CRS 3035

``` r
grid5x5_3035<-grid5x5_3035
```

``` r
plot(grid5x5_3035)
```

## 3.4. surveyed grid

The surveyed grid, this means the grid cells were data was collected

``` r
grid_surveyed
```

# Survey grid

## transform_survey

A function to transform data collected in latitude and longitude from
degrees, transform from 4326 to 3035

``` r
survey_3035<-transform_survey(survey_data=survey_4326,
                 column_latitude='latitude',
                 column_longitude='longitude',
                 from_CRS=4326,
                 to_CRS=3035)
```

## subset_grid

Add values to geometries of the grid, each square is a geometry or
polygon There will be warning that variables are assumed to be spatially
constant throughout all geometries Will print a plot and return the
grids with data

``` r
grid_surveyed<-subset_grid(survey_grid=grid5x5_3035,
                      survey_data=survey_3035,
                      grid_identifier='grid_id')
```

## plot to check grid

``` r
ggplot2::ggplot()+
  ggplot2::geom_sf(data = grid_surveyed, colour = "#42a921", fill= '#bde0fe',alpha=0.9)+
  ggplot2::geom_sf(data = survey_3035)+
  NULL
```

<img src="man/figures/README-unnamed-chunk-14-1.png" width="100%" />

# Densities grid

A series of functions to go from a data frame of surveyed data to a grid

## transform_survey

A function to transform the CRS

``` r
densities_3035<-transform_survey(survey_data=density_survey, 
                 column_latitude='latitude',
                 column_longitude='longitude',
                 from_CRS=4326,
                 to_CRS=3035)
```

## grid_densities

A function to keep only grids with data

``` r
density_grid<-subset_density(density_survey=densities_3035,column_density='densities',
                             survey_grid=grid_surveyed,grid_identifier='grid_id')
```

Check the data

``` r
ggplot2::ggplot()+
  ggplot2::geom_sf(data = density_grid,mapping = ggplot2::aes(fill = mean_density), lwd = 0, colour = NA)
```

<img src="man/figures/README-unnamed-chunk-17-1.png" width="100%" />

# Plot densities

## plot_density

Base data

``` r
my_CRS<-3035
Europa<-sf::st_transform(GermanNorthSea::German_land, my_CRS)
EEZ<-sf::st_transform(GermanNorthSea::German_EEZ, my_CRS)
color_land='#f7bf54'
color_water='#3668b4'
xval<-c(3910000,4250000)
yval<-c(3380000,3680000)
```

Provide density grid and mean densities

``` r
density_plot<-ggplot2::ggplot()+
    # maps
    ggplot2::geom_sf(data = EEZ, colour = 'black', fill = color_water)+
    ggplot2::geom_sf(data = Europa, colour = 'black', fill = color_land)+
    ggplot2::geom_sf(data = density_grid,
                     mapping = ggplot2::aes(fill = mean_density), lwd = 0, colour = NA) + 
  ggplot2::coord_sf(xlim = xval, ylim = yval)+

    NULL
density_plot
```

<img src="man/figures/README-unnamed-chunk-19-1.png" width="100%" />

## add_breaks

A function to add color palette and breaks in the legend, will vary with
the species density estimates

``` r
plot_wbreaks<-add_breaks(density_plot=density_plot,
                     legendbreaks=c(0,0.5,1,1.5,2.0),
                     legendlimits=c(0,2),
                     legendlabels=c('     0','   0.5','   1.0','   1.5','> 2.0'))
plot_wbreaks
```

## add_legend

A function to add the legend inside the plot

``` r
plot_wlegend<-add_legend(
  plot_wbreaks=plot_wbreaks,
  legtx=3905000,
  legty=3510000,
  legxy=c(0.11, 0.21),
  xval=c(3910000,4250000),
  yval=c(3380000,3680000))
plot_wlegend
```

## add_theme

A function to define the theme

``` r
plot_wtheme<-add_theme(plot_wlegend = plot_wlegend)
plot_wtheme
```
