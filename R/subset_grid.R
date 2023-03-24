#' A function to subset the grid and keep only grid cells that were sampled
#'
#' @param survey_grid the grid as sf object
#' @param grid_identifier the name inside each grid to be able to tell them apart
#' @param survey_data the data from your survey as sf object
#'
#' @return a clean grid, only grids with values are returned
#' @export
#'
#' @examples grid_clean<-subset_grid(survey_grid=grid5x5_3035,survey_data=survey_3035,grid_identifier='grid_id')
subset_grid<-function(survey_grid=survey_grid,
                      grid_identifier=grid_identifier,
                      survey_data=survey_data){

  #prints survey data to check they are in the same CRS
  ggplot2::ggplot()+
    ggplot2::geom_sf(data = survey_grid)+
    ggplot2::geom_sf(data = survey_data, colour = "#42a921", fill= '#bde0fe',alpha=0.9)+
    NULL

  # where is the grid intersecting
  grid_subset <- sf::st_intersection(survey_grid,survey_data)

  grid_subset$grid_identifier<-grid_subset[[grid_identifier]]

  # convert to data frame
  grid_subset_df <- grid_subset %>%
    sf::st_drop_geometry() %>%
    dplyr::group_by(grid_identifier)%>%
    dplyr::tally()


  # check which grids had data
  survey_grid$grid_identifier<-survey_grid[[grid_identifier]]

  grid_all <- merge(survey_grid,grid_subset_df, by='grid_identifier', all=TRUE)

  # remove those grids with no data
  grid_clean<-grid_all[stats::complete.cases(grid_all$n), ]

  return(grid_clean)
}
