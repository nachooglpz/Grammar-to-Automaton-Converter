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
      verbatimTextOutput("outputText"),
      plotOutput("outputPlot")
    )
  )
)

server <- function(input, output) {
  
  output$outputPlot <- renderPlot({
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
      g_obj <- grammarToAutomaton(transitions)
      
      g <- g_obj$graph
      edges <- g_obj$edges
      
      # Llamar a isDeterministic y mostrar resultado en consola
      deterministic <- isDeterministic(transitions)
      print(paste("¿Es determinista?:", deterministic))
      
      set.seed(123)
      plot(g, edge.label = edges)
    }
  })
  
}

shinyApp(ui = ui, server = server)
