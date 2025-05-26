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