### Advanced R Programming
# What makes R Unique?


##### Built in R Features

#seq()
#sort()
#rev()
#str()
#append()

for (e in seq(0,50, by=6)){
  if (e%%7==0){
    print(e)
  }
}


sort(c(1, 99, 22, 22, 11, 11, 9))
sort(c(1, 99, 22, 22, 11, 11, 9), dec=TRUE)
sort(c('a', 'e', 'd', 'b', 'C', 'A'))

rev(1:10)
rev(c('a', 'e', 'd', 'b', 'C', 'A'))

str(mtcars)
str(1:10)


v <- 1:2
v2 <- 100:102
append(v, v2)


v <- c(1,2,3)
is.vector(v)

v2 <- as.list((v))
v2

v2 <- as.matrix((v))
v2

v2 <- as.data.frame(v)
v2
