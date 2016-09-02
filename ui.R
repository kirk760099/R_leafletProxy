library(shiny)
library(leaflet)

shinyUI(navbarPage("Kirk Lee's Project",
                   tabPanel("Maps",
                    sidebarLayout(
                      sidebarPanel(
                        checkboxGroupInput("Area", label = h2("administrative district"), 
                        choices = list("星巴克"="star","康是美"="cosmed","捷運站"="mrt"),
                                                   selected = c(1))),
                              mainPanel(
                                leafletOutput("mymap", height="600px"))
                            ))))