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

# set-up code:
# library(osmdata)
# library(tmap)
# tmap_mode("view")
# f = "/tmp/roads.geojson"
# if(!file.exists("f")) {
#   roads = opq("South Ossetia") %>% 
#     add_osm_feature("highway", "primary|secondary|tertiary", value_exact = FALSE) %>% 
#     osmdata_sf()
#   summary(roads$osm_lines$highway)
#   sf::write_sf(roads$osm_lines, f)
#   # file.rename("/tmp/roads.geojson", "~/repos/erum18-transport/roads.geojson")
# }