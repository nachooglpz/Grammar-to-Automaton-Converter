# install.packages("igraph")
# install.packages("shiny")
library(igraph)
library(shiny)

# Remember to check and change (if needed) the working directory
getwd()
setwd('/home/nacho/Documents/Grammar-to-Automaton-Converter')
source('functions.R')

parseGrammarLine('A -> aA')

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Grammar to Automaton Converter"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input text area
      textAreaInput(inputId = "myinputtext",
                    label = "Write your automaton here:"
      )
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Display selected number of bins.
      verbatimTextOutput("outputtext"),
      
    )
  )
)


# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$outputtext <- renderText({
    paste0("Output: ", input$myinputtext)
  })
  
}

# Run the app.
shinyApp(ui = ui, server = server)