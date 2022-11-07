# Recreating a visualization from the Economist
# Correlation between corruption and development
library(ggplot)
library(ggthemes)
# read data
df <- read.csv("Economist_Assignment_Data.csv")
head(df)


# step 1: create a scatter plot

# Data & Aesthetics
pl <- ggplot(df, aes(x=CPI, y=HDI, color=Region))
pl

# Geometry
pl2 <- pl + geom_point(size=4, shape=1)
pl2


# Add a smooth line based on a certain data
pl3 <- pl2 + geom_smooth(aes(group=1), 
                  method='lm', formula=y~log(x), se=F, color='red')
pl3

# this causes too many labels
pl3 + geom_text(aes(label=Country))

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl4 <- pl3 + geom_text(aes(label=Country), color='gray20',
                data=subset(df, Country %in% pointsToLabel), 
                check_overlap=TRUE)
pl4

# Add the Economist theme and add labels
pl5 <- pl4 + theme_economist_white() + scale_x_continuous(limits=c(.9,10.5), breaks=1:10)
pl5

library(plotly)
gpl <- ggplotly(pl5)
gpl










