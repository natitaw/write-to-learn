# Lambdas
sample(1:100, 3)

v <- c(1,2,3,4,5)

addrand <- function(int){
  # takes in x and adds a random number to it
  return(int + sample(1:100, 1))
}

addrand(10)

# lapply list apply
lapply(v, addrand)

# sapply
sapply(v, addrand)

# anonymous functions! 

v <- 1:5
sapply(v, function(num){num*2})

# Apply with multiple inputs
add_choice <- function(num, choice){
  return(num+choice)
}
sapply(v, add_choice, choice=100)

v <- list(c(1,2,3), c(4,5,6), c(7,8,9))
sapply(v, sum)
sapply(v, mean)
sapply(v, round)


## Regular Expressions
text <- "Hi there, do you know who you are really?"
grepl('really', text)
grepl('yes', text)
grepl('REALLY', text)
grepl('REALLY', text, ignore.case = T)


# Dates
dates <- c('2022-01-09', '2022-01-10', '2022-01-11')
sapply(dates, function(this_date){as.Date(this_date)})
Sys.Date()

strptime("11:02:03", format="%H:%M:%s")
