
# This program read the csv file containing temperatures dataand plots the relative data of the weather station selected


#install.packages("tidyverse")
#install.pacakges("shiny")

TEMPERATURES<-function(){


library(ggplot2)
library(shiny)


#setwd("C:/users/mcasagli/Documents/Progetto R/")
#ItalianData <- read.csv(file = '2030378.csv', header = TRUE)



ItalianData <- read.csv(system.file("Data", "2030378.csv", package="Weather"), header = TRUE)


ItalianData$YEAR <- substring(ItalianData$DATE,1,4)
ItalianData$MONTH <- substring(ItalianData$DATE,6,7)



ui <- fluidPage(


  titlePanel("Weather Temperatures"),


  sidebarLayout(

    sidebarPanel(

      # Input: Choose Weather Station

      selectInput("temp", "StationS", c("ITM00016420", "ITM00016045", "ITM00016400","ITM00016245","ITM00016344","ITM00016064","ITM00016360","ITM00016280","ITM00016480","ITM00016061","IT000162240","IT000162580","IT000016239","ITM00016429"))



    ),

    # Main panel
    mainPanel(


      plotOutput(outputId = "Plot"),
      plotOutput(outputId = "Plot2"),
      plotOutput(outputId = "Plot3")
    )
  )
)

# Server
server <- function(input, output) {

  # Bars Temperature Charts

  temperature <-reactive({input$"temp"})


  output$Plot <- renderPlot({


    ggplot (subset(ItalianData,STATION %in% c(input$"temp")), aes( x=MONTH, y=TMAX)) + geom_col(aes(fill = STATION), width = 0.7)


  })

  output$Plot2 <- renderPlot({


    ggplot (subset(ItalianData,STATION %in% c(input$"temp")), aes( x=MONTH, y=TMIN)) + geom_col(aes(fill = STATION), width = 0.7) +
      scale_fill_viridis_d()


  })

  output$Plot3 <- renderPlot({


    ggplot (subset(ItalianData,STATION %in% c(input$"temp")), aes( x=MONTH, y=TAVG)) + geom_col(aes(fill = STATION), width = 0.7) +
      scale_fill_viridis_d(3)


  })


}


  shinyApp(ui, server)

}


