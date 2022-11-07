tail(USPersonalExpenditure)
summary(USPersonalExpenditure)

days <- c('Mon', 'Tues', 'Wed', 'Thu', 'Fri')
temp <- c(22.2, 21, 23,24.3, 25)
rain <- c(T, T, F, F, T)

df <- data.frame(days, temp, rain)

str(df)
summary(df)

df[1:5, c('days', 'temp')]

# days when it rained and temp is > 23
subset(df, subset = rain==T & temp>23)

###### sorting 
sorted.temp <- order(df['temp'])
df[sorted.temp,]

desc.temp <- order(-df['temp'])
df[desc.temp,]

desc.temp <- order(-df$temp)
df[desc.temp,]

## Overview of Data Frame Operations
# Data Frames are the work horse of R

# creating a data frame
empty <- data.frame()
empty

c1 <- 1:10
c2 <- letters[1:10]

df <- data.frame(col.name.1=c1, col.name.2=c2)
df

nrow(df)

colnames(df)

str(df)
summary(df)


# Referencing cells
df[1:2,]

df[[5,2]]
df[5,2]

df[[5, 'col.name.2']]
df[5:8, 'col.name.2']

head(mtcars)
mtcars$mpg
mtcars['mpg']
head(mtcars[c('cyl', 'mpg')])


df2 <- data.frame(col.name.1=2000, col.name.2='new')
df2

dfnew <- rbind(df, df2)
dfnew

df$newcol <- 2*df$col.name.1
df

df$newcol.copy <- df$newcol
df

df[1:5, 'test.col'] <- df$newcol[1:5]
df

colnames(df) <- c('1', '2', '3', '4', 'fivth')
df

colnames(df)[1] <- 'NEW COL NAME'
df

df[1:5,]
head(df, 3)

# select everything but row 2
df[-2,]

## Note: -ve is interestingly used in R

head(mtcars)
# mpg > 20
mtcars[mtcars$mpg>20, ]
# mpg>20 and cyl == 6
mtcars[(mtcars$mpg>20 & mtcars$cyl==6), ]
# also this way
subset(mtcars, mpg>20 & cyl==6)


## dealing with missing data
is.na(df)
any(is.na(df))

# replacing na with averages
df$'5_NO_NA'[is.na(df$fivth)] <- mean(df$fivth, na.rm=T)
df

is.data.frame((df))

# convert matrix to dataframe
my_mat = as.matrix(df)
my_mat

as.data.frame(my_mat)

# avg
mean(df$'3')

df[-2,]

round(mtcars$disp, 3)


