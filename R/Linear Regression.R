# Linear Regression

df <- read.csv('student-mat.csv', sep=';')
head(df, 3)

# Goal: predict G1, G2, and G3 grades using linear regression
summary(df)

# check if there are any null values
any(is.na(df))

library(ggplot2)
library(ggthemes)
library(dplyr)

# Create some type of plot to see correlation between features

# Numerical columns only
num.cols <- sapply(df, is.numeric)

# filter numerical columns only
cor_data <- cor(df[, num.cols])
cor_data

# Visualize Correlations using some nice packages
library(corrgram)
library(corrplot)

corrplot(cor_data, method="color")

# Detailed correlelogram 
corrgram(df, order=TRUE, lower.panel=panel.shade,
         upper.panel=panel.pie, text.panel=panel.txt)

# Histogram
ggplot(df, aes(x=G3)) + geom_histogram(bins=20, alpha=0.5, fill='blue')


# Split data into Train and Test set
library(caTools)

# set a seed
set.seed(101)

# By convention we use the feature we're trying to predict
# into the splitter
sample <- sample.split(df$G3, SplitRatio=0.7)

# train
train <- subset(df, sample==TRUE)
test <- subset(df, sample==FALSE)


# Train and build a model
model <- lm(G3 ~ ., data=train)

# Run the model
summary(model)

# residuals: difference in the error functions
res <- residuals(model)
res <- as.data.frame(res)
head(res)

# plot residuals
ggplot(res, aes(x=res)) + geom_histogram(fill="black", alpha=0.5)

# you would like the residuals to follow a normal distribution
# as that would mean a good balance between precision and accuracy (bulls eye)

# The model is sometimes predicting negative grades that's why the residuals 
# show negative values
# How can we deal with that?

# You can get a few plots directly out of the model
plot(model)

# Predict values off of the test set
# the value you are trying to predict is already
# in your model
G3.predictions <- predict(model, test)

results <- cbind(G3.predictions, test$G3)
colnames(results) <- c('predicted', 'actual')
results <- as.data.frame(results)
head(results)


# How can we take care of the negative predictions
# use a function
to_zero <- function(x){
  if (x<0){
    return(0)
  }else{
    return(x)
  }
}

# Apply zero function
results$predicted <- sapply(results$predicted, to_zero)
head(results %>% arrange(predicted))
print('MSE')
# Mean Squared error
mse <- mean( (results$actual - results$predicted)^2)
mse
print("Sqrt MSE")
mse^0.5

SSE <- sum( (results$actual - results$predicted)^2)
SSE



summary(model)












