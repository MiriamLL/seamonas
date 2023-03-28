#' A function to plot densities inside Europe, focused on the North Sea
#'
#' @param density_grid a grid with density information
#' @param column_density the column where the density is stored
#' @param color_land the color of the land shapefile
#' @param color_water the color of the sea shapefile
#'
#' @return a plot with densities plotted
#' @export
#'
#' @examples plot_density(density_grid=density_grid,column_density='mean_density',
#' color_land='#f7bf54', color_water='#3668b4')
plot_density<-function(density_grid=density_grid,
                       column_density=column_density,
                       color_land=color_land,
                       color_water=color_water){
  #set up parameters
  my_CRS<-3035
  xval<-c(3910000,4250000)
  yval<-c(3380000,3680000)
  ybreaks<-c(53,54, 55,56)

  density_grid$column_density<-density_grid[[column_density]]

  # load shapefiles
  #Europa<-sf::st_transform(GermanNorthSea::German_land, my_CRS)
  #EEZ<-sf::st_transform(GermanNorthSea::German_EEZ, my_CRS)

  # plot
  density_plot<-ggplot2::ggplot()+
    # maps
    #ggplot2::geom_sf(data = EEZ, colour = 'black', fill = color_water)+
    #ggplot2::geom_sf(data = Europa, colour = 'black', fill = color_land)+
    ggplot2::geom_sf(data = density_grid,mapping = ggplot2::aes(fill = column_density), lwd = 0, colour = NA) +
    ggplot2::coord_sf(xlim = xval, ylim = yval)+

    NULL

  density_grid$column_density<-NULL
  return(density_plot)
}
