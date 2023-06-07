library(shiny)
library(ctmm)

shinyModuleUserInterface <- function(id, label) {
  ns <- NS(id) ## all IDs of UI functions need to be wrapped in ns()
  tagList(
    titlePanel("Outlier detection"),
    fluidRow(
      column(4,
             wellPanel(
               sliderInput(
                 ns("fraction"),
                 "Fraction:",
                 min = 0, max = 1, value = 0.
               ),
               sliderInput(
                 ns("columns"),
                 "Columns:",
                 min = 1, max = 10, value = 2.
               )
             )
      )
    ),
    plotOutput(ns("plot"))
  )
}

shinyModule <- function(input, output, session, data){ ## The parameter "data" is reserved for the data object passed on from the previous app
  ns <- session$ns ## all IDs of UI functions need to be wrapped in ns()
  
  svf <- lapply(data, variogram)
  
  row_count <- reactive({
    ceiling(length(svf) / input$columns)
  })
  
  extent_tele <- ctmm::extent(svf)
  
  output$plot <- renderPlot({
    
    req(input$fraction)
    
    graphics::par(mfrow = c(row_count(), input$columns),
                  mar = c(5, 5, 4, 1), ps = 18, cex = 1, cex.main = 0.9)
    
    for (i in seq_along(svf)) {
      plot(svf[[i]], 
           fraction = input$fraction,
           xlim = c(0, extent_tele["max", "x"]),
           ylim = c(0, extent_tele["max", "y"]),
           bty="n")
      graphics::title(names(svf[i]))
    }
    
  })
  
  return(reactive({ 
    data
  })) ## if data are not modified, the unmodified input data must be returned
}
