library(shiny)
library(leaflet)
library(tidyverse)

ui <- fluidPage(
  leafletOutput("map"),
  actionButton("recalc", "New Points"))

server <- function(input, output) {
  points <- eventReactive(input$recalc, {
    cbind(rnorm(80) + 0.0, rnorm(80) + 0.0)}, ignoreNULL = FALSE)
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(data = points())
  })
}

shinyApp(ui, server)