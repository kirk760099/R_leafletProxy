library(shiny)
library(leaflet)
source('source.R')

#' Title
#'
#' @param input 
#' @param output 
#' @param session 
#'
#' @return
#' @export
#'
#' @examples
shinyServer(function(input, output, session) {
  
  ShowId <- eventReactive(input$Area, {
    which(stores$tag ==input$Area)
  })
  
  observeEvent(input$Area, {
    Id = ShowId()
    if( length(ShowId) > 0 )
    {
      lng.path = stores$lan[Id]
      lat.path = stores$lat[Id]
      leafletProxy('mymap',session) %>% clearMarkers() %>% addMarkers(lng=lng.path,lat=lat.path,icon=leafIcons)
    }
  })
  # stores_sel = data.frame()
  # observeEvent(input$Area,{
  #   Id = ShowId()
  #   if(length(ShowId)>0){
  #     stores_sel <- data.frame(stores$lan,stores$lat,stores$tag)
  #   }
  # }
  
  # leafletProxy(stores_sel) %>% addTiles() %>%
  #   # Select from oceanIcons based on df$type
  #   addMarkers(icon = ~totalIcons[tag])  
  # 
  output$mymap <- renderLeaflet({
    markers711 <- leaflet() %>% 
      addTiles() %>%
      setView(121.5467, 25.05248, zoom = 13)
    markers711
  })

})