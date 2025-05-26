# install.packages("igraph")
# install.packages("shiny")

library(igraph)
library(shiny)

grammarToAutomaton <- function(text) {
  
}

parseGrammarLine <- function(line) {
  matches <- regmatches(line, regexec("^([A-Z])\\s*->\\s*([a-z]*)\\s*([A-Z]?)$", line))
  if (length(matches[[1]]) > 0) {
    variable <- matches[[1]][2]  # "S"
    terminal <- matches[[1]][3]  # "a"
    next_variable <- matches[[1]][4]  # "S"
    print(paste("Variable:", variable))
    print(paste("Terminal:", terminal))
    print(paste("Next Variable:", next_variable))
  }
}

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