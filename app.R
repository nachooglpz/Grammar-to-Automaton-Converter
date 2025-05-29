library(igraph)
library(shiny)

# Cargar funciones
# getwd()
# setwd('/home/nacho/Documents/Grammar-to-Automaton-Converter')
source('functions.R')

ui <- fluidPage(
  
  titlePanel("Grammar to Automaton Converter"),
  
  sidebarLayout(
    sidebarPanel(
      textAreaInput(inputId = "myinputtext", label = "Write your automaton here:")
    ),
    
    mainPanel(
      verbatimTextOutput("outputtext"),
      verbatimTextOutput("transitions") 
    )
  )
)

server <- function(input, output) {
  
  output$outputtext <- renderText({
    paste0("Output: ", input$myinputtext)
  })
  
  output$transitions <- renderPrint({
    lines <- strsplit(input$myinputtext, "\n")[[1]]
    transitions <- list()
    
    for (line in lines) {
      result <- parseGrammarLine(line)
      if (!is.null(result)) {
        transitions <- append(transitions, list(result))
      }
    }
    
    if (length(transitions) == 0) {
      print("No valid transitions found.")
    } else {
      print(transitions)
    }
  })
  
}

shinyApp(ui = ui, server = server)
