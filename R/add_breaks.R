#' A function to add breaks on a plot
#'
#' @param density_plot is the a ggplot
#' @param legendbreaks is the breaks in the legend
#' @param legendlimits are the limits in the legend
#' @param legendlabels are the labels in the legend important when you want to use symbols
#'
#' @return a ggplot with a legend label in the color of light blue to red
#' @export
#'
#' @examples add_breaks(density_plot=density_plot,
#' legendbreaks=c(0,0.5,1,1.5,2.0),legendlimits=c(0,2),
#' legendlabels=c('     0','   0.5','   1.0','   1.5','> 2.0'))
add_breaks<-function(density_plot=density_plot,
                     legendbreaks=legendbreaks,
                     legendlimits=legendlimits,
                     legendlabels=legendlabels){

  plot_wbreaks<-density_plot+
    ggplot2::scale_fill_gradientn(

      colours = c("#f1faee", #0 white
                  "#4ea8de", #0.10 lightblue
                  '#1e6091', #0.20 darkblue
                  "#34a0a4", #0.30 darkgreen
                  '#76c893', #0.40 lightgreen
                  '#d9ed92', #0.50 darkyellow
                  "#ffea00", #0.60 bringyellow
                  "#f1ba0a", #0.70 organge
                  '#ff4800', #0.80 darkorgance
                  "#e01e37", #0.90 lightred
                  '#6e1423'  #1.0 darkred
      ),
      #the values are according to the size of the scale (100%), not values of the column
      values = c(0, 0.10,0.20,0.30,0.40,0.50,0.60,0.70,0.80,0.90,1.0),

      limits=legendlimits,
      breaks=legendbreaks,
      labels=legendlabels)+
    ggplot2::guides(fill = ggplot2::guide_colourbar(ticks = FALSE))
  return(plot_wbreaks)
}
