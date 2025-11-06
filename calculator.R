cat("Welcome to R Calculator\n\n")

operations <- as.integer(readline(
"Choose the operation:
1. addition
2. substraction
3. multiplication
4. division
Input: "
))
  
single_method <- function(operation)
{
  number1 = as.numeric(readline("Enter first number : "))
  number2 = as.numeric(readline("Enter second number : "))
  
  result <- switch(
    operations,
    number1 + number2,
    number1 - number2,
    number1 * number2,
    number1 / number2,
    if(number2 == 0) "Error: Cannot divide by zero" else number1 / number2,
    "Invalid choice!"
  )
  return(result)
}

bulk_method <- function(operation)
{
  cat("Input numbers: ")
  numbers = scan()
  
  result <- switch(
    operations,
    sum(numbers, na.rm = TRUE),
    Reduce("-", numbers),
    Reduce("*", numbers),
    Reduce("/", numbers),
    "Invalid choice!"
  )
  return(result)
}

is_bulk <- as.integer(readline("Is it bulk operation (1 yes / 0 no)? "))

if(is_bulk == 1){
  result <- bulk_method(operations)
}else{
  result <- single_method(operations)
}

cat("\nResult:", result, "\n")
