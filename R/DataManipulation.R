# Dplyr to manipulate data 
# Tidyr to clean data

library(dplyr)
library(nycflights13)

head(flights)

head(filter(flights, month==1, carrier=='AA'))

# slicing
slice(flights, 1:11)

# arange
head(arrange(flights, year, month, day, arr_time))
head(arrange(flights, year, month, desc(day), arr_time))


# select
head(select(flights, carrier, arr_time))

# rename
head(rename(flights, airlines_carrier=carrier))


# distinct
distinct(select(flights, carrier))


# mutate
# this is like apply in pandas
head(mutate(flights, new_col=arr_delay-dep_delay))
select(head(mutate(flights, new_col=arr_delay-dep_delay)), arr_delay, dep_delay, new_col)

# transmute
head(transmute(flights, new_col=arr_delay-dep_delay))

# summarise
summarise(flights, avg_air_time=mean(air_time, na.rm=TRUE))
summarise(flights, avg_air_time=sum(air_time, na.rm=TRUE))


# samples
# returning 10 random rows
sample_n(flights, 10)

# returning 10% of rows
sample_frac(flights, 0.1)


# filtering
df <- mtcars

# How to nest using multiple assignments?
filter(df, mpg>20)
sample_n(filter(df, mpg>20), size=5)

a <- filter(df, mpg>20)
b <- sample_n(a, size=5)
result <- arrange(b, desc(mpg))

print(result)

# pipe operator %>%
result <- df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))
print(result)


distinct(mtcars['gear'])
mtcars %>% select(gear) %>% distinct()



mutate(df, Performance=hp/wt)

# mean value of mpg
summarise(df, avg_mpg=mean(mpg), sum_mpg=sum(mpg), std_mpg=sd(mpg))

# mean value of mpg with cyl = 6
df %>% filter(cyl==6) %>% summarise(avg_hp=mean(hp))

summarise(df)
