library(shiny)

ui <- fluidPage(
  includeCSS("www/style.css"),
  navbarPage(div("Insert Title Here", img(src="HBC_logo.png", width = "40%", height = "40%", align = "right")))
)

server <- function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)
