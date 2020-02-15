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
