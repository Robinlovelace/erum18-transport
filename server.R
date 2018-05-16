library(sf)
library(shiny)
library(leaflet)
library(tmap)

server = function(input, output) {
  roads = st_read("roads.geojson")
  # summary(roads$highway)
  
  getroads = reactive({
    roads[roads$highway == input$type, ]
  })
    
  output$map = renderLeaflet({
    m = tm_shape(getroads()) +
      tm_lines(col = "red", lwd = 5) +
      tm_shape(roads) +
      tm_lines()
    tmap_leaflet(m)
    })
}