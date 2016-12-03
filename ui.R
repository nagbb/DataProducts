library(shiny)
shinyUI(fluidPage(
  titlePanel("Box Plot and Prediction of Miles Per Gallon for different parameters"),
  sidebarLayout(
    sidebarPanel(
      h4("Please tick parameters for display of box plots and prediction of Miles per Gallon"),
      checkboxInput("cyl", "Number of cylinders",value=TRUE), 
      checkboxInput("gear", "Number of forward gears",value=TRUE), 
      checkboxInput("carb", "Number of carburetors"),
      h4("Please give value of parameters for prediction of Miles per Gallon"),
      conditionalPanel(
        condition = "input.cyl",
        h5("Number of cylinders"),
        sliderInput("cylno", "",min = 4, max = 8,step=2, value = 6)
      ),
      conditionalPanel(
        condition = "input.gear",
        h5("Number of gears"),
        sliderInput("gearno", "",min = 3, max = 5,step=1, value = 4)
      ),
      conditionalPanel(
        condition = "input.carb",
        h5("Number of carburetors"),
        sliderInput("carbno", "",min = 1, max = 8,step=1, value = 5)
      )
  ),
  mainPanel(
      h3("Car Characteristics"),
      plotOutput("plot1"),
      h4("Miles per Gallon is predicted to be"),
      textOutput("value")
  )
  )
))