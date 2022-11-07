goog <- c(450, 451, 452, 445, 468)
msft <- c(230, 231, 232, 233, 220)

stocks <- c(goog, msft)

stocks.matrix <- matrix(stocks, byrow=TRUE, nrow=2)
days <- c('Mon', 'Tue', 'Wed', 'Thu', 'Fri')
st.names <- c('GOOG', 'MSFT')

colnames(stocks.matrix) <- days
rownames(stocks.matrix) <- st.names

print(stocks.matrix)


# creating vectors
A <- c(1,2,3)
B <- c(4,5,6)

print(cbind(A,B))
print(rbind(A,B))

# creating a 3x3 matrix with numbers 1:9
nums = 1:9
mat = matrix(nums, byrow=TRUE, nrow=3)
print(mat)
print(matrix(nums, nrow=3))

# how to know if an object is a matrix
is.matrix(mat)
is.array((mat))
is.data.frame(mat)

# creating 5x5 matrix 1:25 filled out by row
mat2 = matrix(1:25, byrow=TRUE, nrow=5)
print(mat2)
print(mat2[2, 2:3])

# get [4, 5], [9, 10]
print(mat2)
print(mat2[1:2, 4:5])

print(sum(mat2))
print(rowSums((mat2)))
print(colSums(mat2))


# use runif() to create 4x5 cosisting 20 random numbers
# runif(n, min=0, max=1)
# n is num of observations
mat3 = matrix(runif(20, min=0, max=100), nrow=4)
print(mat3)
