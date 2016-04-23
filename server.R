library(shiny)
library(ggplot2)
library(scales)

# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  # Reactive expression to generate the requested distribution.
  # This is called whenever the inputs change. The output
  # functions defined below then all use the value computed from
  # this expression
  ## data <- reactive({
   ## FT <- switch(input$Function.Type,
   ##                norm = rnorm,
   ##                unif = runif,
   ##                lnorm = rlnorm,
   ##                exp = rexp,
   ##                rnorm)
    
  ##  FT(input$range)
  ## })
  
  # Generate a plot of the data. Also uses the inputs to build
  # the plot label. Note that the dependencies on both the inputs
  # and the data reactive expression are both tracked, and
  # all expressions are called in the sequence implied by the
  # dependency graph
  output$plot <- renderPlot({
    fun.label <- switch(input$Function.Type,
                       sin = "y==sin(x)",
                       cos = "y==cos(x)",
                       exp = "y==exp(x)",
                       log2 = "y==log[2](x)",
                       dnorm = "y==frac(1,sqrt(2*pi))*e^(frac(-x^2,2))",
                       ""
                       ) ##switch
    n <- input$range
    p <- ggplot(data.frame(x=c(n[1],n[2])), aes(x=x, color="red")) +
             stat_function(fun=input$Function.Type, geom = "line", size=1, n=abs((n[1]-n[2]))*100) +
             annotate("text", x=input$range[1]+0.2, y=0.2, parse=TRUE, label=fun.label, color="blue")
    p
    ## hist(data(), main=paste('r', FunType, '(', n[1],",",n[2], ')', sep=''))
  })
  
  # Generate a summary of the data
  output$summary <- renderText({
    fun.label <- switch(input$Function.Type,
                        sin = "y=sin(x)",
                        cos = "y=cos(x)",
                        exp = "y=exp(x)",
                        log2 = "y=log2(x)",
                        dnorm = "y=frac(1,sqrt(2*pi))*e^(frac(-x^2,2))",
                        ""
                       ) ##switch
    
    data.sum <- paste("The function ", fun.label, "is drawn with real number range from ", input$range[1], " to ", input$range[2],
                      " with total sampling points of ", abs((input$range[1]-input$range[2]))*100, ".", sep='')
    data.sum
  })
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(x=input$range)
  })
  
})