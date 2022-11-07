v <- c(1,2,3)
m <- matrix(1:10, nrow=2)
df <- head(mtcars)

class(v)
class(m)
class(df)

# how can we put all these three in one single variable
# we can use the list

my.list <- list(v, m, df)
my.list

my.named.list <- list(sample.vec=v, my.matrix=m, sample.df=df)
my.named.list

# you can call out of lists
my.named.list$my.matrix
class(my.named.list$my.matrix)

# indexing
my.named.list[2]


