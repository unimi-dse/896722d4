
# Server
server <- function(input, output) {

ItalianData <- read.csv(system.file("extdata", "2030378.csv", package="Weather"), header = TRUE)


ItalianData$YEAR <- substring(ItalianData$DATE,1,4)
ItalianData$MONTH <- substring(ItalianData$DATE,6,7)

  # Bars Temperature Charts

  temperature <-reactive({input$"temp"})


  output$Plot <- renderPlot({


    ggplot2::ggplot (subset(ItalianData,STATION %in% c(input$"temp")), aes( x=MONTH, y=TMAX)) + geom_col(aes(fill = STATION), width = 0.7)


  })

  output$Plot2 <- renderPlot({


    ggplot2::ggplot (subset(ItalianData,STATION %in% c(input$"temp")), aes( x=MONTH, y=TMIN)) + geom_col(aes(fill = STATION), width = 0.7) +
      scale_fill_viridis_d()


  })

  output$Plot3 <- renderPlot({


    ggplot2::ggplot (subset(ItalianData,STATION %in% c(input$"temp")), aes( x=MONTH, y=TAVG)) + geom_col(aes(fill = STATION), width = 0.7)


  })


}
