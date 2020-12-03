#Function to wrap the title of the graphs
wrapper <- function(x, ...) 
{
  paste(strwrap(x, ...), collapse = "\n")
}