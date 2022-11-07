# Cleaning data with tidyr
library(tidyr)
library(data.table)
# A tidy data is organised in such a way that every cell is a
# value for a specific variable or feature of a specific observation. 
# gather, spread, separate and unite

# gather
# this is a weird function that lets you change
# rows into columns
# might actually be useful
# analogus to pivot tables

comp <- c(1,1,1,2,2,2,3,3,3)
yr <- c(1998,1999,2000,1998,1999,2000,1998,1999,2000)
q1 <- runif(9, min=0, max=100)
q2 <- runif(9, min=0, max=100)
q3 <- runif(9, min=0, max=100)
q4 <- runif(9, min=0, max=100)

df <- data.frame(comp=comp,year=yr,Qtr1 = q1,Qtr2 = q2,Qtr3 = q3,Qtr4 = q4)
df

# restructuring the time component
gather(df, Quarter, Revenue, Qtr1:Qtr4)
# Or
df %>% gather(TATA, REVV, Qtr1:Qtr4)

stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks

gathered_df = gather(stocks, company, price, X,Y,Z)

# spread
# spreading the data which is gathered
spread(gathered_df, company, price)

spread(gathered_df, time, price)


# separate
df <- data.frame(new.col=c(NA, 'a.x', 'b.y', 'c.z'))
df

separate(df, new.col, c('ABC', 'XYZ'))

df <- data.frame(new.col=c(NA, 'aAx', 'bAy', 'cAz'))
df
separate(df, col=new.col, into=c('ABC', 'XYZ'), sep='A')

# unite - reverse of separate
df <- data.frame(new.col=c(NA, 'aAx', 'bAy', 'cAz'))
df

df_sep <- separate(df, col=new.col, into=c('ABC', 'XYZ'), sep='A')
df_sep

unite(df_sep, col=new.joined.col, ABC, XYZ, sep='-JOIN-')
