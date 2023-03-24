#' A function to transform the CRS from the dataframe and coverts it to sf object
#'
#' @param survey_data your data to transform
#' @param column_longitude the name of the column where the longitude data is
#' @param column_latitude the name of the column where the latitude data is
#' @param from_CRS the CRS of the data collection for example degrees is in 4236
#' @param to_CRS the CRS of the final data neede for example 3035
#'
#' @return a sf object with an assigned CRS
#' @export
#'
#' @examples survey_3035<-transform_survey(survey_data=survey_4326,
#' column_latitude='latitude',column_longitude='longitude',
#' from_CRS=4326,to_CRS=3035)
transform_survey<-function(survey_data=survey_data,
                           column_longitude=column_longitude,
                           column_latitude=column_latitude,
                           from_CRS=from_CRS,
                           to_CRS=to_CRS){




  # Standarize names
  survey_data$lat<-as.numeric(survey_data[[column_latitude]])
  survey_data$lon<-as.numeric(survey_data[[column_longitude]])

  # Both should have the same CRS
  survey_sf <- survey_data %>%
    sf::st_as_sf(coords = c("lon", "lat"))

  ## Set CRS
  survey_from_crs = sf::st_set_crs(survey_sf, paste0("EPSG:",from_CRS))

  ## Transform CRS
  survey_to_crs = sf::st_transform(survey_from_crs, to_CRS)

  return(survey_to_crs)
}
