# print("App.R - concordanceIndex dependency...")
# concordanceIndex::concordanceIndex

# Simple Shiny App based on:
# https://github.com/rstudio/shiny-examples/tree/master/084-single-file
shinyApp(
  ui = bootstrapPage(
    numericInput('n', 'Number of objects', 200),
    plotOutput('plot')
  ),
  server = function(input, output) {
    output$plot <- renderPlot({
      hist(runif(input$n))
    })
  }
)
