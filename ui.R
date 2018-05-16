library(sf)
library(shiny)
library(leaflet)
library(spData)
fluidPage(shiny::selectInput(
  inputId = "type",
  label = "Road type",
  choices = c(
    "primary", "secondary", "residential",
    "tertiary", "path", "pedestrian", "other"
  )
),

  leafletOutput(outputId = "map")
)