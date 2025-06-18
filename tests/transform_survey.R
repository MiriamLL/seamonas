#' A function to transfor the CRS from your data frame
#'
#' @param survey_data A data frame with longitude and latitude in degrees
#' @param column_longitude The name of the column where the longitude data is
#' @param column_latitude The name of the column where the latitude data is
#' @param from_CRS The CRS when the data was collected, if is degrees probably 4326
#' @param to_CRS  The CRS that you want your data to be presented, for example 3035
#'
#' @return returns a sf object with CRS
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
