name_of_func <- function(in1, in2, in3=45){
  # code to execute
  res = sum(in1, in2, in3)
  return(res)
}


# product of two ints
prod <- function(int1, int2){
  return(int1*int2)
}
prod(2,2)

# a functions with two args an int and a vector of ints
# returns True if int is present in the vector else false

checker <- function(int1, vec){
  
  for (i in vec){
    if (int1==i) {
      return(TRUE)
    }
  }
  return(FALSE)
}

checker(1, c(1,2,3))
checker(5, c(1,2,3))

# count the number of occurrences of int in a vector

ctr <- function(int, vec){
  my_ctr <- 0
  for (i in vec){
    if (i==int){
      my_ctr <- my_ctr+1
    }
  }
  return(my_ctr)
}

ctr(1, c(1, 1, 2))
ctr(1, c(0, 22, 2))

# 3 int args, return sum
# if int is div by 3 then it doesn't count

div_3 <- function(int1, int2, int3){
  my_sum <- 0
  for (e in c(int1, int2, int3)){
    if (e%%3!=0){
      my_sum <- my_sum + e
    }
  }
  return(my_sum)
}

div_3(3,3,3)
div_3(3,3,2)
div_3(13,13,2)



