# Bar plots
# categorical data
library(ggplot2)

df <- mpg
head(df)

# Data & Aestethics
pl <- ggplot(df, aes(x=class))
pl + geom_bar()

# outline color and fill
pl + geom_bar(color='black', fill='yellow')

# fill with another column
pl + geom_bar(aes(fill=drv))

# can also change stacking type
pl + geom_bar(aes(fill=drv), position = 'dodge')

# also as a percentage
pl + geom_bar(aes(fill=drv), position = 'fill')

