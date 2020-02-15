
TEMPERATURES <- function(){

  dir <- system.file("shinyApp", package = "Weather")
  shiny::runApp(dir)
}
