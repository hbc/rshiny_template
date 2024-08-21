library(shiny)

ui <- fluidPage(
  includeCSS("www/style.css"),
  navbarPage(div("KEGG Pathway Overlap", img(src="HBC_logo.png", width = "40%", height = "40%", align = "right")))
)

server <- function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)