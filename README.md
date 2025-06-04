# Grammar-to-Automaton-Converter

Bernardo Santiago Marín
Luis Ignacio Gómez López
Francisco Raziel Aldalón Aguayo

Converter Project Description

In teams:

Make use of reactive programming in R to create a Shiny app that converts a regular grammar into a finite automaton.
Check the presentation "2.4 Regular Grammars.pptx" on how to convert a regular grammar into an automaton.
The user interface needs to include a text area (textAreaInput) where the user can type a regular grammar.
The user interface needs to have a section where the corresponding automaton is displayed.
While the user types in a grammar, the program shows the corresponding automaton in real time.
The grammar input format is X -> Y where X is the antecedent and Y is the consequent. Examples: S -> aA, A -> bB, B -> z.
The initial state is denoted with S. In the automaton diagram the initial state S needs to be green colored.
The final state Z needs to be colored in red.
Your program needs to check if the automaton is deterministic or non deterministic. Display a text label that dynamically changes and prints "deterministic" or "non-deterministic".  
 

Example user input:

Non deterministic
S -> bB
B -> aA
A -> Z

Deterministic
S -> aA
S -> bB
A -> aA
A -> bB
B -> aA
B -> bB
C -> aZ
C -> bZ

Non deterministic
S -> aA
S -> bB
A -> aA
A -> bB
B -> aA
B -> bB
C -> aZ

Non deterministic
S -> aA
S -> bB
A -> aA
A -> bB
B -> aA
B -> bB
C -> aZ
C -> aZ

Example output:

In the example above, the initial state is marked with an arrow. In your program, the initial node should be colored in green. The final state in the above example is depicted with two circles. In your program it needs to b colored in red.

You can use the igraph library to draw the graphs. Here Links to an external site. you can find a tutorial.

TIP: When there is more than one arc going out from the same node and they point to the same target node, the arc labels may overlap. To avoid this, you can use the curve_multiple Links to an external site. function that computes an optimum curvature and returns a vector with the curvatures. Then, you can use the returned vector and pass it as an argument (edge.curved) to the plot function.

plot(g, edge.curved=curves, .... ) where curves is the returned vector from function curve_multiple().

An alternative way of avoiding overlapped labels is by creating a single arc and separating the symbols with " , " or any other character.

