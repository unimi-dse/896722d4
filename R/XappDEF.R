
TEMPERATURES <- function(){

  dir <- system.file("ShinyAPP", package = "Weather")
  shiny::runApp(dir)
}
