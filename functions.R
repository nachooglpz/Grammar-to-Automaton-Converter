# install.packages("igraph")
library(igraph)

# Converts the grammar line to a transition list and an edge list
grammarToAutomaton <- function(listTransitions) {
  transitions = c()
  edges = c()
  for (item in listTransitions) {
    transitions <- c(transitions, item[[1]], item[[2]][[2]]) # Creates the transitions list
    edges <- c(edges, item[[2]][[1]]) # Creates the edges list
  }
  
  g <- graph(transitions, directed = TRUE) # Creates the graph object
  
  # Returns the graph elements
  return(list(graph = g, edges = edges))
}

parseGrammarLine <- function(line) {
  matches <- regmatches(line, regexec("^\\s*([A-Z])\\s*->\\s*([a-z]*)\\s*([A-Z]?)\\s*$", line))
  
  if (length(matches[[1]]) > 0) {
    variable <- matches[[1]][2]        # Estado actual
    terminal <- matches[[1]][3]        # Terminal (puede estar vacío)
    next_variable <- matches[[1]][4]   # Siguiente estado (puede estar vacío)
    
    # Si no hay terminal o next_variable, lo dejamos como "F"
    if (terminal == "") terminal <- ""  # Permitir transición vacía (epsilon)
    if (next_variable == "") next_variable <- "F"
    
    # Devolver en el formato (S, (a, B))
    return(list(variable, list(terminal, next_variable)))
  } else {
    return(NULL)  # Si no hay match, devolver NULL
  }
}

isDeterministic <- function(transitions) {
  # Creamos un vector de claves únicas tipo "estado|caracter"
  keys <- character()
  
  for (transition in transitions) {
    state <- transition[[1]]
    char <- transition[[2]][[1]]
    
    key <- paste(state, char, sep = "|")  # Ejemplo: "S|a"
    
    if (key %in% keys) {
      return(FALSE)  # Si el par ya existe, no es determinista
    }
    
    keys <- c(keys, key)  # Agregamos la clave
  }
  
  return(TRUE)  # Si no hay duplicados, es determinista
}





