# Data Capstone Project

batting <- read.csv("Batting.csv")
head(batting)
summary(batting$yearID)
str(batting)
head(batting$AB)
head(batting$X2B)

# Add batting average
batting$BA <- batting$H / batting$AB

# Add on base percentage

batting$OBP <- (batting$H + batting$BB + batting$HBP) / (batting$AB + batting$BB + batting$HBP + batting$SF)
tail(batting, 2)

# Creating X1B (Singles)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

# Creating Slugging Average (SLG)
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB

# Merge salary information
salary <- read.csv("Salaries.csv")
head(salary, 2)

# Limit data from 1984 onwards
batting <- subset(batting, yearID >= 1985)
summary(batting$yearID)


combo <- merge(batting, salary, by=c('playerID', 'yearID'))
summary(combo)

# lost players
lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )
lost_players

lost_players <- subset(lost_players, yearID ==2001)

lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]

library(ggplot2)
ggplot(combo, aes(x=OBP, y=salary)) + geom_point(size=2)
