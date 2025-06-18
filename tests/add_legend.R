#' A function to add the legend inside the plot
#'
#' @param plot_wbreaks is the plot already with selected breaks in the colors
#' @param legxy is the place where the legend will be set inside the panel
#'
#' @return a plot with the legend inside a defined limits
#' @export
#'
#' @examples add_legend(plot_wbreaks=density_wmap,legxy=c(0.11, 0.21))
add_legend<-function(plot_wbreaks=plot_wbreaks,
                     legxy=legxy){

  plot_wlegend<-plot_wbreaks+
    ggplot2::theme(
      legend.position = legxy,
      legend.title = ggplot2::element_blank(),
      legend.text= ggplot2::element_text(size=10,color="#343a40",family='sans'),
      legend.spacing.y =  ggplot2::unit(0.01, 'cm'),
      legend.spacing.x =  ggplot2::unit(0.2, 'cm'),

      legend.background = ggplot2::element_rect(fill='transparent',colour ="transparent"),
      legend.box.background = ggplot2::element_rect(fill='transparent',colour ="transparent"),
      legend.key = ggplot2::element_rect(fill = "transparent", colour = "transparent"),

      #size
      legend.key.size =  ggplot2::unit(0.7, 'cm')
    )

  return(plot_wlegend)
}

