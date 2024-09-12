library(shiny)
library(shinydashboard)
library(bslib)
library(DT)
library(tidyverse)
library(ggupset)
library(ggprism)

ui <-  page_fluid(
  navbarPage(div("Data Lake", img(src="HBC_logo.png", width = "40%", height = "40%", align = "right"))),
  includeCSS("www/style.css"),
  navset_tab(
    nav_panel("Data Overview",
              fluidRow(
                DTOutput("tbl_datasets")
              )
    ),
    nav_panel("Column Analysis",
              h2("Column Analysis"),
              selectInput("input_column","Choose Column", choices = colnames(Seatbelts)),
              fluidRow(
                column(12,
                       box(width=12,
                           status="info",
                           solidHeader = TRUE,
                           plotOutput("plot_example", height = 500),
                       )
                )
              )
    )
  )
)

server <- function(input, output, session) {

  output$tbl_datasets = renderDT(
    datatable(Seatbelts,
              rownames= FALSE,
              filter = 'top',
              extensions = 'Buttons',
              options = list(scrollX = TRUE
                             , pageLength = 5
                             , dom = 'Blfrtip'
                             ,buttons = c('copy', 'csv', 'excel', 'pdf', 'print')
              )),
    server = FALSE
  )

  output$plot_example = renderPlot({
    req(input$input_column)
    Seatbelts %>%
      ggplot(aes(x = get(input$input_column))) +
      geom_density() +
      theme_prism()
  })

}

shinyApp(ui = ui, server = server)
