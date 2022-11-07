# Logistic Regression using the Titanic Data Set
# as a method of classification 
# Type I (FP) and Type II errors (FN)

df.train <- read.csv('titanic_train.csv')
head(df.train)
str(df.train)

# Check missing data using Amelia
library(Amelia)

# Miss Map -> This is cool and useful
help("missmap")
missmap(df.train, main="Missing Map",
        col=c("yellow", "black"), legend=FALSE)

# Data Exploration
library(ggplot2)
library(ggthemes)
ggplot(df.train, aes(Survived)) + geom_bar()
ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))

# Gender and Sex
ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

ggplot(df.train, aes(Age)) + geom_histogram(bins=20, fill="blue", ha=0.5)

ggplot(df.train, aes(SibSp)) + geom_bar()

ggplot(df.train, aes(Fare)) + geom_histogram(fill="green",
                                             color="black", alpha=0.5)

# Fill in Missing Data
missmap(df.train, main="Missing Map",
        col=c("yellow", "black"), legend=FALSE)

# Fill in the average age by passenger class
pl <- ggplot(df.train, aes(Pclass, Age)) 
pl <- pl + geom_boxplot(aes(group=Pclass, fill=factor(Pclass), alpha=0.4))
pl + scale_y_continuous(breaks=seq(min(0), max(80), by=2)) + theme_economist()

# Create a function to replace missing age values
# Imputation of age based on class

impute_age <- function(age,class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}

fixed.ages <- impute_age(df.train$Age, df.train$Pclass)
df.train$Age <- fixed.ages

## Miss Map

missmap(df.train, main="Imputation Map", col=c("yellow", "black"), 
        legend=FALSE)


library(dplyr)
# Select features
df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin )
head(df.train)

# Convert to factors
df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

str(df.train)

# Logistic Regression Model
log.model <- glm(Survived ~ . , family=binomial(link="logit"), data=df.train)

summary(log.model)

library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio=.7)
final.train <- subset(df.train, split==TRUE)
final.test <- subset(df.train, split==FALSE)

final.log.model <- glm(Survived ~ . , family=binomial(link="logit"), 
                       data=final.train)

summary(final.log.model)

# Model Prediction
head(final.test, 2)

fitted.probs <- predict(final.log.model, final.test, type='response')
fitted.results <- ifelse(fitted.probs>0.5, 1, 0)

misClassError <- mean(fitted.results != final.test$Survived)
print(1 - misClassError)

# Confusion Matrix
table(final.test$Survived, fitted.probs>0.5)






