library(igraph)
library(shiny)

# Cargar funciones
# getwd()
# setwd('/home/nacho/Documents/Grammar-to-Automaton-Converter')
source('functions.R')

getTransitions <- function(inputText) {
  lines <- strsplit(inputText, "\n")[[1]]
  transitions <- list()
  
  for (line in lines) {
    result <- parseGrammarLine(line)
    if (!is.null(result)) {
      transitions <- append(transitions, list(result))
    }
  }
  
  return(transitions)
}

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
  
  trans <- reactive({
    req(input$myinputtext)
    getTransitions(input$myinputtext)
  })
  
  output$outputText <- renderText({
    deterministic <-isDeterministic(trans())
    text <- if(deterministic) 'deterministic' else 'non-deterministic'
    paste0('Type of automaton: ', text)
  })
  
  output$outputPlot <- renderPlot({
    transitions <- trans()
    
    if (length(transitions) != 0) {
      # Calls the graph components
      g_obj <- grammarToAutomaton(transitions)
      g <- g_obj$graph
      edges <- g_obj$edges
      
      # Llamar a isDeterministic y mostrar resultado en consola
      deterministic <- isDeterministic(transitions)
      
      set.seed(123)
      plot(g, edge.label = edges)
      plot(g, edge.label = edges, edge.curved = curve_multiple(g))
    }
  })
  
}

shinyApp(ui = ui, server = server)
