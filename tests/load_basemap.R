#' A function to create basemap
#'
#' @param my_CRS define your CRS, for example 4326
#' @param color_land select color in hex format for land
#' @param color_water select color in hex format for water
#' @return returns a ggplot
#' @export
#'
#' @examples load_basemap(my_CRS=4326, color_land='#f7bf54', color_water='#3668b4')
load_basemap<-function(my_CRS=my_CRS, color_land=color_land, color_water=color_water){

  Alemania<- sf::st_transform(GermanNorthSea::Germany, my_CRS)
  Europa<-sf::st_transform(GermanNorthSea::German_land, my_CRS)
  EEZ<-sf::st_transform(GermanNorthSea::German_EEZ, my_CRS)

  BaseMap<-ggplot2::ggplot() +
    ggplot2::geom_sf(data = EEZ, colour = 'black', fill = 'transparent')+
    ggplot2::geom_sf(data = Alemania, colour = 'black', fill = color_land, alpha=0.5)+
    ggplot2::geom_sf(data = Europa, colour = 'black', fill = color_land)+
    ggplot2::xlab('Longitude')+
    ggplot2::ylab('Latitude')+
    ggplot2::theme_bw()+
    ggplot2::theme(legend.text=ggplot2::element_text(size=10),
          legend.position='none',
          panel.grid.major = ggplot2::element_blank(),
          panel.grid.minor = ggplot2::element_blank(),
          panel.background = ggplot2::element_rect(fill = color_water))+
    ggplot2::scale_x_continuous(labels = function(x) paste0(x, '\u00B0', "W")) +
    ggplot2::scale_y_continuous(labels = function(x) paste0(x, '\u00B0', "N"))
  return(BaseMap)}
