#' A function to add the legend inside the plot
#'
#' @param plot_wbreaks is the plot already with selected breaks in the colors
#' @param legtx is where the title for the legend will be set in the x axis
#' @param legty is where the title for the legend will be set in the y axis
#' @param legxy is the place where the legend will be set inside the panel
#' @param xval are the limits from the x axis
#' @param yval are the limits for the y axis
#'
#' @return a plot with the legend inside a defined limits
#' @export
#'
#' @examples add_legend(plot_wbreaks=plot_wbreaks,
#' legtx=3905000,legty=3510000,legxy=c(0.11, 0.21),xval=c(3910000,4250000),yval=c(3380000,3680000))
add_legend<-function(plot_wbreaks=plot_wbreaks,
                     legxy=legxy,
                     legtx=legtx,
                     legty=legty,
                     xval=xval,
                     yval=yval){

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
    )+

    ggplot2::annotate(geom="text",
                      x=legtx, y=legty,
                      label=expression(atop("Density"), paste("[ind/k", m^2,"]")),
                      color="#343a40",hjust = 0)

  return(plot_wlegend)
}
