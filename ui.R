library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Tabsets"),
  
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the
  # br() element to introduce extra vertical spacing
  sidebarLayout(
    sidebarPanel(
                  radioButtons("Function.Type", "Type of Function:",
                               c("Sine" = "sin",
                                 "Cosine" = "cos",
                                 "Exponential" = "exp",
                                 "Logarithm" = "log2",
                                 "Normal" = "dnorm")),
                  helpText("Please select the function you care to enquire its curve."),
                  br(),
                  br(),
                  br(),
                  
                  # Specification of range within an interval
                  sliderInput("range", "Value Range:",
                              min = -10, max = 10, value = c(-5,5)), ##sliderInput
                  helpText("Please select the range where you want to see the curve.")
                ), ##sidebarPanel
    
    
    # Show a tabset that includes a plot, summary, and table view
    # of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("1: Function Plot", plotOutput("plot")), 
                  tabPanel("2: Data Summary", verbatimTextOutput("summary")), 
                  tabPanel("3: Data Table", tableOutput("table"))
      )
    )
  )
))