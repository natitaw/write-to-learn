# Predicting a continuous value with Linear Regression
# Is Linear Regression even a good option for this type of problem?

# You are provided hourly rental data spanning two years. 
# For this competition, the training set is comprised of the first 19 days of each month, 
# while the test set is the 20th to the end of the month. 
# You must predict the total count of bikes rented during each hour covered by the test set, 
# using only information available prior to the rental period.

df <- read.csv("bikeshare.csv")
head(df)

print("We are trying to predict the total number of rentals per day: count")


# Create a scatter plot of count vs temp. Set a good alpha value.

library(ggplot2)
library(ggthemes)
library(dplyr)

# Data & Aesthetics
pl <- ggplot(df, aes(x=temp, y=count, color=temp))
pl + geom_point(alpha=0.3) + theme_bw()

# Plot count versus datetime as a scatter plot with a color gradient based on temperature. 
# You'll need to convert the datetime column into POSIXct before plotting.
df$datetime <- as.POSIXct(df$datetime, format="%Y-%m-%d %H:%M:%S", tz="UTC")
str(df)


pl2 <- ggplot(df, aes(x=datetime, y=count, color=temp))
tex <- "*Notice two things: sesonality in winter and summer; and that total number of rentals are increasing in general"
pl2 <- pl2 + geom_point(alpha=0.4) + theme_economist() + labs(caption = tex) 

pl2 + scale_color_continuous(low="#55D8CE", high="#FF6E2E")


 # What is the correlation between temp and count?

# Numerical columns only
num.cols <- sapply(df, is.numeric)

# filter numerical columns only
cor_data <- cor(df[, num.cols])
cor_data[c('temp', 'count'), c('temp', 'count')]


# Explore the season data by creating a box plot

# Data & Aesthetics

pl3 <- ggplot(df, aes(x=factor(season), 
                      y=count, color=factor(season)))
pl3 + geom_boxplot() + theme_bw() + xlab('Season') + ylab('Total Bike Rentals')


# Create an "hour" column that takes the hour from the datetime column. 
# Using an anonymous function
df$hour <- sapply(df$datetime, function(x){format(x, "%H")})
head(df, 2)

# Create a scatter plot of count vs hour

# Data & Aesthetics
pl4 <- ggplot(filter(df, workingday==1), aes(hour,count))
# fill in empty space sigh jitters
pl4 <- pl4 + geom_point(aes(color=temp), 
                        position=position_jitter(w=1, h=0),
                        alpha=0.5)
pl4 <- pl4 + scale_color_gradientn(colours=c('dark blue', 'blue', 
                                      'light blue', 'light green',
                                      'yellow', 'orange', 'red'))
pl4 + theme_bw()

# Building a Linear Regression Model
head(df, 3)

# Build Model
temp_model <- lm(count ~ temp, df)
plot(temp_model)

# A linear regression model is not appropriate here because
# the data has seasonality and a growth trend. This also means
# that splitting the data into test/train does not make sense
# There are other methods we can use that will perform better
# on this sort of (time-series) data

summary(temp_model)

# What is the number of bikes we can expected to be rented
# if the temperature is 25 C?

temp_test <- data.frame(temp=c(25))
predict(temp_model, temp_test)


df$hour <- sapply(df$hour, as.numeric)
head(df)

## Extending a model
# Just remove the columns you don't want
model <- lm(count ~ . -casual -registered -datetime -atemp, df)
summary(model)










