library(shiny)
library(tidyverse)
library(plotly)

ui <- fluidPage(
  numericInput(inputId = "n", value = 1, label = "Samples"),
  plotlyOutput(outputId = "thePlot")
)

server <- function(input, output) {
  
  dataset <- reactive({
    tibble(x = rnorm(as.numeric(input$n)))
  })
  
  plt <- reactive(
    ggplot(dataset(), aes(x)) +
      geom_histogram()
  )
  
  output$thePlot <- renderPlotly(
    ggplotly(plt())
  )
}

# Start the Server
shinyApp(
  ui = ui,
  server = server,
  options = list(port = 8081, host = "0.0.0.0")
)