grammarToAutomaton <- function(text) {
  
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



