#' launches the shinyAppDemo app
#'
#' @export launchApp
#'
#' @return shiny application object
#'
#' @example \dontrun {launchApp()}
#'
#' 
#'

library(shiny)

# wrapper for shiny::shinyApp()
launchApp <- function() {
  shiny::shinyApp(ui = appUI, server = appServer)
}

launchApp()



