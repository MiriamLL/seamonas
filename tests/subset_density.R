#' A function to add density values to the grid, and keep only the grid will values.
#'
#' @param density_survey a sf object with geometry and density columns
#' @param column_density the name of the column where the density values are stored
#' @param grid_identifier is the name that each grid has
#' @param survey_grid is the grid from to the surveyed area
#'
#' @return a sf object with the surveyed grid and in each grid the average densities
#' @export
#'
#' @examples subset_density(density_survey=densities_3035,column_density='densities',
#' survey_grid=grid_surveyed,grid_identifier='grid_id')
subset_density<-function(density_survey=density_survey,
                         column_density=column_density,
                         grid_identifier=grid_identifier,
                         survey_grid=survey_grid){



  #standarize names
  density_survey$density_var<-as.numeric(density_survey[[column_density]])

  # where is the grid intersecting
  grid_subset <- sf::st_intersection(survey_grid,density_survey)

  # both should have grid identifier
  grid_subset$grid_identifier<-grid_subset[[grid_identifier]]

  # convert to data frame
  grid_subset_df <- grid_subset %>%
    sf::st_drop_geometry()

  # calculate mean densities for grid
  grid_subset_mean <- grid_subset_df  %>%
    dplyr::group_by(grid_identifier) %>%
    dplyr::mutate(mean_density=mean(density_var))

  #add densities to each grid polygon
  grid_all <- merge(survey_grid,grid_subset_mean, by='grid_identifier', all=TRUE)


  # mean values per grid
  grid_group<-grid_all %>%
    dplyr::group_by(grid_identifier)%>%
    dplyr::summarise_at(dplyr::vars(density_var),
                        list(mean_density = mean))

  # remove those grids with no data
  grid_clean<-grid_group[stats::complete.cases(grid_group$mean_density), ]
  return(grid_clean)
}
