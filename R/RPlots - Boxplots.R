# Box Plots
library(ggplot2)

df <- mtcars
head(df)


# Data & Aesthetics
# It is important to factor categorical variables
pl <- ggplot(df, aes(x=factor(cyl), y=mpg))
pl + geom_boxplot()

# flipping coordinates
pl + geom_boxplot() + coord_flip()

# coloring
pl + geom_boxplot(aes(fill=factor(cyl)))

# theme
pl + geom_boxplot(aes(fill=factor(cyl))) + theme_dark()

