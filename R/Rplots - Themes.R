# Themes
library(ggplot2)

# Applying a theme a layer for all plots
theme_set(theme_minimal())


# Data & Aesthetics
pl <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
pl

# manually add a theme
pl + theme_dark()


# Getting more theme options with 
library(ggthemes)

pl + theme_economist()

pl + theme_fivethirtyeight()

pl + theme_wsj()

