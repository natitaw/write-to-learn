x <- 0

while (x<10){
  print(paste0('X is: ', x))
  
  x <- x+1
  
  if (x==5){
    print('X is now equal to 5! Breaking')
    break
    print('Not yet breaking')
  }
}

for (x in 1:10){
  print(x)
}

mat <- matrix(1:25, nrow=5)

print(mat)
for (row in 1:nrow(mat)){
  for (col in 1:ncol(mat)){
    print(paste(
'The elemennt at row:',row, 'and col:', col, 'is', mat[row, col] ))
  }
}


