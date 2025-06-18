#' A function to add my theme to a ggplot
#'
#' @param plot_wlegend is the plot to be modified
#'
#' @return a plot with specific colors and lines around, a little bit like theme_bw but with latitude and longitude
#' @export
#'
#' @examples add_theme(plot_wlegend = density_wmap)
add_theme<-function(plot_wlegend=plot_wlegend){

  plot_wtheme<-plot_wlegend+
    ggplot2::xlab('Longitude')+
    ggplot2::ylab('Latitude')+
    ggplot2::scale_x_continuous(labels = function(x) paste0(x, '\u00B0', "W")) +
    ggplot2::scale_y_continuous(labels = function(x) paste0(x, '\u00B0', "N"))+

    # theme
    ggplot2::theme(

      #panel
      panel.border = ggplot2::element_rect(colour = "black", fill=NA, size=1),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),
      panel.background = ggplot2::element_blank())

  return(plot_wtheme)
}
